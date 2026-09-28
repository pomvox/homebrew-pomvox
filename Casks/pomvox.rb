cask "pomvox" do
  # "short,build". Sparkle's appcast carries both, and `brew livecheck`
  # reports them as one comma-separated version — so declaring only the
  # short string fails `brew audit --online` every release with
  #   Version '0.2.5' differs from '0.2.5,16' retrieved by livecheck.
  version "0.2.9,20"
  sha256 "08668e58292ae7bd2cf5a92d39c846e68e7a29a39467636cd8245aff75add3c6"

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
