cask "brainfm" do
  version "1.0.0"
  sha256 "PLACEHOLDER"

  url "https://github.com/balcsida/brainfm-swift/releases/download/v#{version}/BrainFM-#{version}-arm64.dmg"
  name "Brain.fm"
  desc "Native macOS menu bar app for Brain.fm focus music"
  homepage "https://github.com/balcsida/brainfm-swift"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "BrainFM.app"
end
