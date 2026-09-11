# sidimam/homebrew-tap

Homebrew tap for [aMule Remote](https://github.com/sidimam/AmuleRemote) — a native Mac / iPhone / iPad / Apple Vision Pro / Apple TV remote control for an `amuled` (aMule) server.

## Install

```bash
brew install --cask sidimam/tap/amule-remote
```

The cask installs the same **Developer ID signed and notarized** DMG published in the [GitHub Releases](https://github.com/sidimam/AmuleRemote/releases/latest) into `/Applications`. Update with:

```bash
brew upgrade --cask amule-remote
```

Requires an Apple Silicon Mac running macOS 14 (Sonoma) or later.

**What's new in 1.4 (build 19):** guided introduction at the first launch with iCloud backup restore of the server profiles, notifications managed from the system Settings (downloads started and completed, server unreachable, eD2k/Kad drops and reconnections), app colour applied to the whole interface, paste several eD2k links from the clipboard (*Add links from the Clipboard* in the Dock and Transfers menus) and share eD2k links. Shortcuts and Siri actions are part of the Mac App Store build. Full history: [Changelog](https://github.com/sidimam/AmuleRemote/blob/main/CHANGELOG.md). iPhone/iPad, Mac App Store, Apple Vision Pro and Apple TV: [App Store](https://apps.apple.com/app/amule-remote/id6800020841).

## Unraid Drive (cask)

[Unraid Drive](https://github.com/sidimam/unraid-drive) puts your Unraid shares in the Finder sidebar (File Provider) with a menu bar panel — the Mac version of the iOS/iPadOS/visionOS app. The cask installs the Developer ID signed and notarized DMG from the [GitHub Releases](https://github.com/sidimam/unraid-drive/releases/latest); the Mac App Store build is the same app.

```bash
brew install --cask sidimam/tap/unraid-drive
```

After the first launch enable the extension under System Settings › General › Login Items & Extensions › File Providers. Requires macOS 14 (Sonoma) or later.

**What's new in 1.2 (build 23):** choose which shares to show (after connecting, in the walkthrough, in Settings and per server; Files, Finder, Shortcuts and Apple TV honour it, the choice syncs with iCloud); permission errors carry the gateway's explanation (unraid-gateway 0.5.5+). 1.1 brought Shortcuts and Siri actions, notifications, the walkthrough with iCloud restore, app colour and the Apple TV app. Full history: [Changelog](https://github.com/sidimam/unraid-drive/blob/main/CHANGELOG.md). It needs the unraid-gateway container (or the formula below) on the server side.

## unraid-gateway (formula)

[unraid-gateway](https://github.com/sidimam/unraid-gateway) is the server side of the **Unraid Drive** iOS/iPadOS/visionOS app: a single authenticated port that serves your shares to the Files app and proxies the Unraid API. It normally runs as a Docker container on Unraid (Community Applications); this formula builds the same Go binary for a Mac or Linux box that has the shares mounted, for example a Mac mini next to the NAS.

```bash
brew install sidimam/tap/unraid-gateway
brew services start unraid-gateway
```

**What's new in 0.6.0:** media tickets — `POST /api/v1/fs/ticket` returns a signed, expiring URL (`/media/<ticket>`) for one file, so players that cannot send headers (the mpv player of Unraid Drive on Apple TV, VLC, a browser) can stream with Range support; nothing secret in the URL. 0.5.5 brought Unraid's standard file permissions (0777/0666) and self-explaining permission errors. Full history: [Changelog](https://github.com/sidimam/unraid-gateway/wiki/Changelog).


Point `DATA_ROOT` (default `$(brew --prefix)/var/unraid-gateway/data`) at one folder per share and `UNRAID_URL` at your Unraid WebGUI; see `brew info unraid-gateway` for the caveats and the [gateway wiki](https://github.com/sidimam/unraid-gateway/wiki) for the full setup.
