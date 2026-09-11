cask "pomvox" do
  # "short,build". Sparkle's appcast carries both, and `brew livecheck`
  # reports them as one comma-separated version — so declaring only the
  # short string fails `brew audit --online` every release with
  #   Version '0.2.5' differs from '0.2.5,16' retrieved by livecheck.
  version "0.2.7,18"
  sha256 "62c299cdf59b6f17fd77bb1bd7cb493868d1a9de5b43885f66b12dd8e549be02"

  url "https://github.com/pomvox/pomvox/releases/download/v#{version.csv.first}/Pomvox.dmg"
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
