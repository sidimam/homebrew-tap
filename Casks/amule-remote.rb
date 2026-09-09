cask "amule-remote" do
  version "1.3,18"
  sha256 "ac8079c178284df51b44e61c25e0e82f2316b0568de01f3ca7d633750bfb6b0f"

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
