# sidimam/homebrew-tap

Homebrew tap for [aMule Remote](https://github.com/sidimam/AmuleRemote) — a native Mac / iPhone / iPad / Apple Vision Pro remote control for an `amuled` (aMule) server.

## Install

```bash
brew install --cask sidimam/tap/amule-remote
```

The cask installs the same **Developer ID signed and notarized** DMG published in the [GitHub Releases](https://github.com/sidimam/AmuleRemote/releases/latest) into `/Applications`. Update with:

```bash
brew upgrade --cask amule-remote
```

Requires an Apple Silicon Mac running macOS 14 (Sonoma) or later.

## unraid-gateway (formula)

[unraid-gateway](https://github.com/sidimam/unraid-gateway) is the server side of the **Unraid Drive** iOS/iPadOS/visionOS app: a single authenticated port that serves your shares to the Files app and proxies the Unraid API. It normally runs as a Docker container on Unraid (Community Applications); this formula builds the same Go binary for a Mac or Linux box that has the shares mounted, for example a Mac mini next to the NAS.

```bash
brew install sidimam/tap/unraid-gateway
brew services start unraid-gateway
```

Point `DATA_ROOT` (default `$(brew --prefix)/var/unraid-gateway/data`) at one folder per share and `UNRAID_URL` at your Unraid WebGUI; see `brew info unraid-gateway` for the caveats and the [gateway wiki](https://github.com/sidimam/unraid-gateway/wiki) for the full setup.
