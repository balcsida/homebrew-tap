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
