cask "molivpn" do
  version "1.0.3"

  on_macos do
    arch arm: "arm64", intel: "amd64"

    sha256 arm:   "8b5acbd48dc770161b1d9904e1d45878382c57359796e1cc239fb1baaf51c6e0",
           intel: "ce6d892eb212f2ae8806c9a2a2e60d9b2d65a625f22e38cfb06f57680c0e35ac"

    url "https://github.com/zhizhi2021/molivpn/releases/download/v#{version}/MoliVPN-#{version}-macos-#{arch}.dmg"
  end

  name "茉莉VPN"
  desc "Multi-platform proxy client based on ClashMeta"
  homepage "https://github.com/zhizhi2021/molivpn"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "茉莉VPN.app"

  postflight do
    system_command "xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/茉莉VPN.app"]
  end

  uninstall quit: "com.molivpn.app"

  zap trash: [
    "~/Library/Application Support/com.molivpn.app",
    "~/Library/Caches/com.molivpn.app",
    "~/Library/Preferences/com.molivpn.app.plist",
    "~/Library/Saved Application State/com.molivpn.app.savedState",
  ]
end
