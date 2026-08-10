cask "pomvox" do
  version "0.2.4"
  sha256 "645b876d1b8b4f0ec826d595274803669669458a881e218d650f88e777e248cf"

  url "https://github.com/pomvox/pomvox/releases/download/v#{version}/Pomvox.dmg"
  name "Pomvox"
  desc "On-device voice dictation for Apple Silicon Macs"
  homepage "https://github.com/pomvox/pomvox"

  auto_updates true

  livecheck do
    url "https://raw.githubusercontent.com/pomvox/pomvox/main/appcast.xml"
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
