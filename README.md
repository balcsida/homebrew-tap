# Homebrew Tap

Homebrew tap for my macOS applications and CLI tools.

## Installation

```bash
brew tap balcsida/tap
```

## Available Formulas

### opencode-fork

CLI build of [opencode](https://opencode.ai) from my fork at [balcsida/opencode](https://github.com/balcsida/opencode), with LiteLLM provider support. Auto-updated on each fork release.

```bash
brew install balcsida/tap/opencode-fork
```

Installs an `opencode` binary to `/opt/homebrew/bin`. Tracks `balcsida/opencode` releases (e.g. `v1.14.28-litellm.2`), not the upstream `anomalyco/opencode` build.

### zendesk-cli and zendesk-mcp-server

Unofficial command-line client and Model Context Protocol server for the Zendesk API, from [balcsida/zendesk-rs](https://github.com/balcsida/zendesk-rs). Install either or both. New releases are picked up daily.

```bash
brew install balcsida/tap/zendesk-cli         # the `zendesk` binary
brew install balcsida/tap/zendesk-mcp-server  # the `zendesk-mcp-server` binary
```

### graphnest

Command-line tool for [GraphNest](https://github.com/balcsida/graphnest): imports an existing CodeGraph index, checks it against the commit and publishes it to a GraphNest server. `graphnest login` signs in to the server through the browser. Prebuilt for macOS and Linux; new releases are picked up daily.

```bash
brew install balcsida/tap/graphnest
```

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
brew uninstall <formula-name>         # for formulas (e.g. opencode-fork)
brew untap balcsida/tap
```
