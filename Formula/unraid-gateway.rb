class UnraidGateway < Formula
  desc "Authenticated file API and Unraid GraphQL proxy for the Unraid Drive app"
  homepage "https://github.com/sidimam/unraid-gateway"
  url "https://github.com/sidimam/unraid-gateway/archive/refs/tags/v0.10.0.tar.gz"
  sha256 "deb6a3b8eac4106bd39b8ff2fe4ac25b61b68879eaa8bd345f0ba5e6ce124749"
  license "MIT"
  head "https://github.com/sidimam/unraid-gateway.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/sidimam/unraid-gateway/internal/server.Version=v#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/unraid-gateway"
    (var/"unraid-gateway/data").mkpath
    (var/"log").mkpath
  end

  def caveats
    <<~EOS
      unraid-gateway serves the folders found under DATA_ROOT (one sub-folder per share)
      and validates API keys against your Unraid server. Before starting the service:

        mkdir -p #{var}/unraid-gateway/data
        ln -s /Volumes/documents #{var}/unraid-gateway/data/documents   # one link per share

      then set the Unraid WebGUI URL for the service (default http://192.168.1.10):

        sudo mkdir -p #{etc}/unraid-gateway && echo 'UNRAID_URL=http://<unraid-ip>' | sudo tee #{etc}/unraid-gateway/env

      Start with `brew services start unraid-gateway`; the web UI is then at http://localhost:8484/.
      On Unraid itself install the container instead (Community Applications / template in the repo).
    EOS
  end

  service do
    run [opt_bin/"unraid-gateway"]
    keep_alive true
    environment_variables DATA_ROOT: var/"unraid-gateway/data", LISTEN_ADDR: ":8484", USER_AUTH: "off"
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
