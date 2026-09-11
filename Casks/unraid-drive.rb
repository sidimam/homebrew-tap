cask "unraid-drive" do
  version "1.0,19"
  sha256 "8df2a243bf59f90e152d88239de5fa506edf689d4293009fc58c112713009224"

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
