cask "molivpn" do
  version "1.0.1"

  on_macos do
    arch arm: "arm64", intel: "amd64"

    sha256 arm:   "d889e7def65a63e3e652cb5e0b90254a7d11295181c6f5a78a296db693bba1f8",
           intel: "640c67e6441631cff2d5f2053b6d7181f998e0e357856470ff31ad9e59341e01"

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
