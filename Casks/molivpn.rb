cask "molivpn" do
  version "1.0.0"

  on_macos do
    arch arm: "arm64", intel: "amd64"

    sha256 arm:   "5bdeb88dd1362d6bd57923288e13dae4d6742b0a1d2008d1903bdb96b8a3be3d",
           intel: "f0827e55420a63f049b6cc9594bb5d2a9a392012a381c9b05748b12cac3f89b3"

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
