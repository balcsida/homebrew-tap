cask "noqcnolife" do
  version "1.4.0"
  sha256 "b1b6736f1a68d414b6b49cb185d2fe43062f333ec42bdb795537358c41c741d5"

  url "https://github.com/balcsida/NoQCNoLife/releases/download/v#{version}/NoQCNoLife-#{version}.dmg"
  name "No QC, No Life"
  desc "Control Bose QuietComfort headphones from macOS"
  homepage "https://github.com/balcsida/NoQCNoLife"

  auto_updates false
  depends_on macos: ">= :high_sierra"

  app "NoQCNoLife.app"

  uninstall quit: "io.github.balcsida.NoQCNoLife"

  zap trash: [
    "~/Library/Preferences/io.github.balcsida.NoQCNoLife.plist",
    "~/Library/Application Support/NoQCNoLife",
  ]
end
