cask "octoshim" do
  version "0.1.0"
  sha256 "61b8f2ed317af76098ba7386edf21738d46db3d6aa1e222a131c4a3695f4d36b"

  url "https://github.com/balcsida/octoshim/releases/download/v#{version}/OctoShim-#{version}.zip"
  name "OctoShim"
  desc "Menu-bar shim that routes GitHub Desktop links to gh or git clones"
  homepage "https://github.com/balcsida/octoshim"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "OctoShim.app"

  caveats <<~EOS
    OctoShim release builds are ad-hoc signed. If Gatekeeper blocks the app,
    reinstall with:
      brew reinstall --cask --no-quarantine octoshim
    or clear the quarantine attribute:
      xattr -cr "#{appdir}/OctoShim.app"
  EOS

  zap trash: [
    "~/.octoshim.json",
    "~/Library/Application Support/OctoShim",
  ]
end
