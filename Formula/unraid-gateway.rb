class UnraidGateway < Formula
  desc "Authenticated file API and Unraid GraphQL proxy for the Unraid Drive app"
  homepage "https://github.com/sidimam/unraid-gateway"
  url "https://github.com/sidimam/unraid-gateway/archive/refs/tags/v0.18.1.tar.gz"
  sha256 "8319647afab51785109dee30b8ac54b000db171b2653d3f393ebe086ebd31f1b"
  license "MIT"
  head "https://github.com/sidimam/unraid-gateway.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/sidimam/unraid-gateway/internal/server.Version=v#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/unraid-gateway"
    # brew services has no environment file of its own: this launcher loads etc/unraid-gateway/env
    # (KEY=value lines, e.g. UNRAID_URL, which the gateway requires) and then starts the gateway.
    (bin/"unraid-gateway-service").write <<~SH
      #!/bin/sh
      ENV_FILE="#{etc}/unraid-gateway/env"
      if [ -f "$ENV_FILE" ]; then
        set -a
        . "$ENV_FILE"
        set +a
      fi
      exec "#{opt_bin}/unraid-gateway" "$@"
    SH
    chmod 0755, bin/"unraid-gateway-service"
    (var/"unraid-gateway/data").mkpath
    (var/"unraid-gateway/config").mkpath
    (var/"log").mkpath
    (etc/"unraid-gateway").mkpath
  end

  def caveats
    <<~EOS
      unraid-gateway serves the folders found under DATA_ROOT (one sub-folder per share)
      and validates API keys against your Unraid server. Before starting the service:

        mkdir -p #{var}/unraid-gateway/data
        ln -s /Volumes/documents #{var}/unraid-gateway/data/documents   # one link per share

      then write the Unraid WebGUI URL (required) in the service's environment file:

        echo 'UNRAID_URL=http://<unraid-ip>' >> #{etc}/unraid-gateway/env

      Any other setting (TELEGRAM_BOT_TOKEN, SMTP_HOST, USER_AUTH, DATA_ROOT…) goes in the same file.
      Start with `brew services start unraid-gateway`; the web UI is then at http://localhost:8484/.
      Log: #{var}/log/unraid-gateway.log.
      On Unraid itself install the container instead (Community Applications / template in the repo).
    EOS
  end

  service do
    run [opt_bin/"unraid-gateway-service"]
    keep_alive true
    # State (devices, item index, web UI key, notification settings, syncs) lives next to DEVICES_FILE.
    environment_variables DATA_ROOT:          var/"unraid-gateway/data",
                          DEVICES_FILE:       var/"unraid-gateway/config/devices.json",
                          INDEX_DB:           var/"unraid-gateway/config/index.db",
                          WEBUI_API_KEY_FILE: var/"unraid-gateway/config/webui.key",
                          LISTEN_ADDR:        ":8484",
                          USER_AUTH:          "off"
    log_path var/"log/unraid-gateway.log"
    error_log_path var/"log/unraid-gateway.log"
    working_dir var/"unraid-gateway"
  end

  test do
    port = free_port
    data = testpath/"data"
    (data/"share").mkpath
    pid = fork do
      ENV["LISTEN_ADDR"] = ":#{port}"
      ENV["DATA_ROOT"] = data
      ENV["UNRAID_URL"] = "http://127.0.0.1:1"
      exec bin/"unraid-gateway"
    end
    sleep 2
    assert_match "\"status\":\"ok\"", shell_output("curl -s http://127.0.0.1:#{port}/healthz")
  ensure
    Process.kill("TERM", pid)
    Process.wait(pid)
  end
end
