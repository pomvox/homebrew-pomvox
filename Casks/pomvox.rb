cask "pomvox" do
  version "0.2.2"
  sha256 "dc777d39a82002f41e0c426f1b93207409586f1d7e2e3e0b16876890cf77d214"

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
