cask "amule-remote" do
  version "1.4,19"
  sha256 "99b294e080c5aef6eefaf3e224e88d56d2f1504d90b12d1ff650cc6e08ba2097"

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
