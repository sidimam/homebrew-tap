cask "amule-remote" do
  version "1.4,20"
  sha256 "d58b0cd701d701cf251606d597681e4d53db1843071d4cc03a36340a59d5781c"

  url "https://github.com/sidimam/AmuleRemote/releases/download/v#{version.csv.first}-build#{version.csv.second}/aMuleRemote-macOS.dmg"
  name "aMule Remote"
  desc "Remote control for an amuled (aMule) server over the EC protocol"
  homepage "https://github.com/sidimam/AmuleRemote"

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
  depends_on arch: :arm64

  app "aMule Remote.app"

  zap trash: [
    "~/Library/Preferences/com.sdimambro.amule-remote.plist",
    "~/Library/Saved Application State/com.sdimambro.amule-remote.savedState",
  ]
end
