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

## Unraid Drive (cask)

[Unraid Drive](https://github.com/sidimam/unraid-drive) puts your Unraid shares in the Finder sidebar (File Provider) with a menu bar panel — the Mac version of the iOS/iPadOS/visionOS app. The cask installs the Developer ID signed and notarized DMG from the [GitHub Releases](https://github.com/sidimam/unraid-drive/releases/latest); the Mac App Store build is the same app.

```bash
brew install --cask sidimam/tap/unraid-drive
```

After the first launch enable the extension under System Settings › General › Login Items & Extensions › File Providers. Requires macOS 14 (Sonoma) or later.

**What's new in 1.1 (build 20):** Shortcuts and Siri actions (save clipboard, upload, get, list, refresh, test connection), notifications when the gateway is unreachable or a file could not sync, walkthrough at every update with iCloud restore, app colour applied to the whole app. Full history: [Changelog](https://github.com/sidimam/unraid-drive/blob/main/CHANGELOG.md). It needs the unraid-gateway container (or the formula below) on the server side.

## unraid-gateway (formula)

[unraid-gateway](https://github.com/sidimam/unraid-gateway) is the server side of the **Unraid Drive** iOS/iPadOS/visionOS app: a single authenticated port that serves your shares to the Files app and proxies the Unraid API. It normally runs as a Docker container on Unraid (Community Applications); this formula builds the same Go binary for a Mac or Linux box that has the shares mounted, for example a Mac mini next to the NAS.

```bash
brew install sidimam/tap/unraid-gateway
brew services start unraid-gateway
```

Point `DATA_ROOT` (default `$(brew --prefix)/var/unraid-gateway/data`) at one folder per share and `UNRAID_URL` at your Unraid WebGUI; see `brew info unraid-gateway` for the caveats and the [gateway wiki](https://github.com/sidimam/unraid-gateway/wiki) for the full setup.
