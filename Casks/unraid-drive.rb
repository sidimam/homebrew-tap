cask "unraid-drive" do
  version "1.3,30"
  sha256 "127a24e1a8e5fcf47f53553a12018f40ec38992cdb3ebd42d5b992f1c8f247a6"

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

  caveats <<~EOS
    After the first launch enable the extension under
    System Settings › General › Login Items & Extensions › File Providers → Unraid Drive.
    The server side is the unraid-gateway container (or `brew install sidimam/tap/unraid-gateway`).
  EOS

  zap trash: [
    "~/Library/Containers/com.sdimambro.unraid-drive",
    "~/Library/Group Containers/group.com.sdimambro.unraid-drive",
    "~/Library/Preferences/com.sdimambro.unraid-drive.plist",
  ]
end
