cask "noqcnolife" do
  version "1.5.0"
  sha256 "1c788ba1596424b313d6920b815949c4d59f1a2c23fd60378c59d8a7eaf45a83"

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
