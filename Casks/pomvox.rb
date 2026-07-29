cask "pomvox" do
  version "0.2.1"
  sha256 "ffd495556d5a27503b3d2d6d5dcaa8320c83da350870fbebe8dfc388cc803900"

  url "https://github.com/abhiram304/pomvox/releases/download/v#{version}/Pomvox.dmg"
  name "Pomvox"
  desc "On-device voice dictation for Apple Silicon Macs"
  homepage "https://github.com/abhiram304/pomvox"

  auto_updates true

  livecheck do
    url "https://raw.githubusercontent.com/abhiram304/pomvox/main/appcast.xml"
    strategy :sparkle
  end

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Pomvox.app"

  zap trash: [
    "~/.pomvox",
    "~/Library/Caches/app.pomvox.hub",
    "~/Library/HTTPStorages/app.pomvox.hub",
    "~/Library/Preferences/app.pomvox.hub.plist",
  ]
end
