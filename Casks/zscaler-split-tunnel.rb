cask "zscaler-split-tunnel" do
  version "1.0.0"
  sha256 "7f5314e9c1f626bbcad1647ada2d8de0e3148221fbc02fda8f6fe3ee518307ba"

  url "https://github.com/balcsida/zscaler-split-tunnel/releases/download/v#{version}/ZscalerSplitTunnel-#{version}.dmg"
  name "Zscaler Split Tunnel"
  desc "Split tunneling for Zscaler on macOS"
  homepage "https://github.com/balcsida/zscaler-split-tunnel"

  depends_on macos: ">= :sonoma"

  app "Zscaler Split Tunnel.app"
end
