cask "amule-remote" do
  version "1.2,17"
  sha256 "776ed47be55ccfeff8897482d30d4b0284a7a199fea83d678f182b8fbf93aa90"

  url "https://github.com/sidimam/AmuleRemoteiOS/releases/download/v#{version.csv.first}-build#{version.csv.second}/aMuleRemote-macOS.dmg"
  name "aMule Remote"
  desc "Remote control for an amuled (aMule) server over the EC protocol"
  homepage "https://github.com/sidimam/AmuleRemoteiOS"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)-build(\d+)$/i)
    strategy :github_latest do |json, regex|
      match = json["tag_name"]&.match(regex)
      next if match.blank?

      "#{match[1]},#{match[2]}"
    end
  end

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "aMule Remote.app"

  zap trash: [
    "~/Library/Preferences/com.sdimambro.amule-remote.plist",
    "~/Library/Saved Application State/com.sdimambro.amule-remote.savedState",
  ]
end
