cask "unraid-drive" do
  version "1.5.1,46"
  sha256 "ceab48ab9b9f4dec4a329ae5b505b4408521c2580df1f07c54e1f6ae817e39bc"

  url "https://github.com/sidimam/unraid-drive/releases/download/v#{version.csv.first}-build#{version.csv.second}/Unraid-Drive-macOS.dmg"
  name "Unraid Drive"
  desc "Unraid shares in the Finder sidebar (File Provider) with a menu bar panel, via unraid-gateway"
  homepage "https://github.com/sidimam/unraid-drive"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)-build(\d+)$/i)
    strategy :github_latest do |json, regex|
      match = json["tag_name"]&.match(regex)
      next if match.blank?

      "#{match[1]},#{match[2]}"
    end
  end

  depends_on macos: :sonoma

  app "Unraid Drive.app"

  # Quit the running app (and with it the File Provider extension) before the bundle is replaced:
  # swapping the bundle under a running extension leaves the Finder location in an error state.
  uninstall quit: "com.sdimambro.unraid-drive"

  caveats <<~EOS
    The app is quit for the upgrade: open Unraid Drive again afterwards (it checks the gateway
    and rebuilds its Finder locations by itself). After the first launch enable the extension under
    System Settings › General › Login Items & Extensions › File Providers → Unraid Drive.
    The server side is the unraid-gateway container (or `brew install sidimam/tap/unraid-gateway`).
  EOS

  zap trash: [
    "~/Library/Containers/com.sdimambro.unraid-drive",
    "~/Library/Group Containers/group.com.sdimambro.unraid-drive",
    "~/Library/Preferences/com.sdimambro.unraid-drive.plist",
  ]
end
