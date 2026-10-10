cask "molivpn" do
  version "1.0.2"

  on_macos do
    arch arm: "arm64", intel: "amd64"

    sha256 arm:   "b873b714d75b9c020ebb63c5f65637d496334f7e949e3d00b862be1380e3d705",
           intel: "24e8b672448c44dd2c7a23e7cf89516cd28639504af1412b186bec04f8e7e756"

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
