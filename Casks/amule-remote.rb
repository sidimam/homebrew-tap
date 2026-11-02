cask "amule-remote" do
  version "1.5.1,27"
  sha256 "23c6e48e90b0cab60d408cb9ae7817dee2cd30f446c0916e09cf3fd882fabf82"

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
