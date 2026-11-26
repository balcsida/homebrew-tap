# Homebrew Tap

Homebrew tap for my macOS applications and CLI tools.

## Installation

```bash
brew tap balcsida/tap
```

## Available Formulas

### zendesk-cli and zendesk-mcp-server

Unofficial command-line client and Model Context Protocol server for the Zendesk API, from [balcsida/zendesk-rs](https://github.com/balcsida/zendesk-rs). Install either or both. Updated as each release is published.

```bash
brew install balcsida/tap/zendesk-cli         # the `zendesk` binary
brew install balcsida/tap/zendesk-mcp-server  # the `zendesk-mcp-server` binary
```

### graphnest

Command-line tool for [GraphNest](https://github.com/balcsida/graphnest): imports an existing CodeGraph index, checks it against the commit and publishes it to a GraphNest server. `graphnest login` signs in to the server through the browser. Prebuilt for macOS and Linux; updated on each graphnest release after an install test on macOS.

```bash
brew install balcsida/tap/graphnest
```

### teams-cli

Pre-release build of the Microsoft Teams CLI from my fork at [balcsida/ms-teams-cli](https://github.com/balcsida/ms-teams-cli), carrying the configurable `--redirect-uri` browser login ([osodevops/ms-teams-cli#125](https://github.com/osodevops/ms-teams-cli/pull/125)) until it ships upstream. macOS only.

```bash
brew install balcsida/tap/teams-cli
```

Installs the `teams` binary and its man pages. The same formula name exists in `osodevops/tap`, so use the fully-qualified name. Once an upstream release includes the feature, switch back with `brew uninstall balcsida/tap/teams-cli && brew install osodevops/tap/teams-cli`.

## Available Casks

### Brain.fm

Native macOS menu bar app for Brain.fm focus music.

```bash
brew install brainfm
```

- [Brain.fm Repository](https://github.com/balcsida/brainfm-swift)

### NoQCNoLife

Control Bose QuietComfort headphones from macOS.

```bash
brew install noqcnolife
```

- [NoQCNoLife Repository](https://github.com/balcsida/NoQCNoLife)

### Teleporter

A UniFi Teleport client that routes only your console's networks through the tunnel, as a menu bar app with the `teleporter` command. Updated on each Teleporter release after an install test on macOS.

```bash
brew install --cask balcsida/tap/teleporter
```

The app is ad-hoc signed, not notarized; the cask's caveats say how to allow it past Gatekeeper.

- [Teleporter Repository](https://github.com/balcsida/teleporter)

### ANYK

Hungarian Tax Authority (NAV) form filler application for macOS.

```bash
brew install anyk
```

550+ NAV form templates are also available:

```bash
brew search balcsida/tap/anyk-
brew install anyk-25szja
```

- [ANYK Details](https://github.com/balcsida/homebrew-anyk)

## Uninstallation

```bash
brew uninstall --cask <cask-name>     # for casks
brew uninstall <formula-name>         # for formulas (e.g. zendesk-cli)
brew untap balcsida/tap
```
