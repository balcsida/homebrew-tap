cask "zscaler-split-tunnel" do
  version "1.0.0"
  sha256 "PLACEHOLDER"

  url "https://github.com/balcsida/zscaler-split-tunnel/releases/download/v#{version}/ZscalerSplitTunnel-#{version}.dmg"
  name "Zscaler Split Tunnel"
  desc "Split tunneling for Zscaler on macOS"
  homepage "https://github.com/balcsida/zscaler-split-tunnel"

  depends_on macos: ">= :sonoma"

  app "Zscaler Split Tunnel.app"
end
