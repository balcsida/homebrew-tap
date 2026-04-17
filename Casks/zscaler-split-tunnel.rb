cask "zscaler-split-tunnel" do
  version "1.1.0"
  sha256 "11325008b7ac8511583310729391ca116cf3ea2bd62e7f8d088b757e21b295ff"

  url "https://github.com/balcsida/zscaler-split-tunnel/releases/download/v#{version}/ZscalerSplitTunnel-#{version}.dmg"
  name "Zscaler Split Tunnel"
  desc "Split tunneling for Zscaler on macOS"
  homepage "https://github.com/balcsida/zscaler-split-tunnel"

  depends_on macos: ">= :sonoma"

  app "Zscaler Split Tunnel.app"
end
