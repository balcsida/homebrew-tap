cask "teleporter" do
  version "0.1.0"
  sha256 "9736f622e5a513f1b5ca742cb113b6b3dff712ce545d75651921f8e796f17c85"

  url "https://github.com/balcsida/teleporter/releases/download/v#{version}/Teleporter-#{version}.zip"
  name "Teleporter"
  desc "UniFi Teleport client that routes only your console's networks"
  homepage "https://github.com/balcsida/teleporter"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Teleporter.app"
  binary "#{appdir}/Teleporter.app/Contents/MacOS/teleporter"

  # The root helper runs a copy of the CLI, so it goes too; an upgrade must not leave the old one running.
  uninstall launchctl: "io.github.balcsida.teleporter.daemon",
            quit:      "io.github.balcsida.teleporter",
            delete:    [
              "/Library/PrivilegedHelperTools/teleporter",
              "/var/run/teleporter.status",
            ]

  zap trash: [
    "/var/log/teleporter.log",
    "~/.config/teleporter",
  ]

  caveats <<~EOS
    Teleporter is ad-hoc signed, not notarized, so Gatekeeper blocks both the
    app and the `teleporter` command at first. To allow them, run:
      xattr -dr com.apple.quarantine "#{appdir}/Teleporter.app"
    or choose Open Anyway in System Settings > Privacy & Security for each.

    To stay connected in the background, install the helper with
    "Install Helper…" in the menu bar, or:
      sudo teleporter install
    Upgrading or uninstalling the cask removes the helper; install it again
    after an upgrade.
  EOS
end
