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

**What's new in 1.4.1 (build 21):** 1.4.1 fixes the Apple TV build (iCloud entitlements were missing, so sync never worked on tvOS), makes the walkthrough's iCloud backup search more patient and draws real color dots in the Apple TV color picker. What's new in 1.4: guided introduction at the first launch with iCloud backup restore of the server profiles, notifications managed from the system Settings (downloads started and completed, server unreachable, eD2k/Kad drops and reconnections), app colour applied to the whole interface, paste several eD2k links from the clipboard (*Add links from the Clipboard* in the Dock and Transfers menus) and share eD2k links. Shortcuts and Siri actions are part of the Mac App Store build. Full history: [Changelog](https://github.com/sidimam/AmuleRemote/blob/main/CHANGELOG.md). iPhone/iPad, Mac App Store, Apple Vision Pro and Apple TV: [App Store](https://apps.apple.com/app/amule-remote/id6800020841).

## Unraid Drive (cask)

[Unraid Drive](https://github.com/sidimam/unraid-drive) puts your Unraid shares in the Finder sidebar (File Provider) with a menu bar panel — the Mac version of the iOS/iPadOS/visionOS app. The cask installs the Developer ID signed and notarized DMG from the [GitHub Releases](https://github.com/sidimam/unraid-drive/releases/latest); the Mac App Store build is the same app.

```bash
brew install --cask sidimam/tap/unraid-drive
```

After the first launch enable the extension under System Settings › General › Login Items & Extensions › File Providers. Requires macOS 14 (Sonoma) or later.

**What's new in 1.3 (build 35):** transient network errors (connection refused, a dead VPN interface, a Wi-Fi hand-over) are retried before the Finder sees them. Build 34: the Files / Finder location is checked and rebuilt automatically on the first launch and after every update (the cask now quits the app before upgrading and relaunches it). Build 33: multi-selection in the explorer on every device (Copy, Cut, Move…, Copy to…, Download, Share…, Delete on the whole selection), *Download* of files and folders, and on the Mac *Start without a window* (menu bar only, or menu bar + Dock). Build 32: Move… and Copy to… confirm the destination with a fixed *Move here* / *Copy here* button (on the Mac the confirmation was unreachable); one *Open* entry for every file. Build 31: Mac — fixed the crash when playing MKV, AVI and the other mpv formats (the notarized app was killed by the hardened runtime as soon as the video loaded). Build 30: restore first from iCloud on a new or reinstalled device with re-registration on the gateways, same device id after a reinstall, Apple TV shows what waits in iCloud and receives every server with one pairing code, the real reason when a video cannot stream, Rename and New folder on Apple TV. Build 29: a Files-style explorer on every device, Quick Look plus a built-in mpv player (MKV, AVI, WebM, FLAC…) and EPUB/CBZ/ZIP readers, choose which shares to show. Full history: [Changelog](https://github.com/sidimam/unraid-drive/blob/main/CHANGELOG.md). It needs the unraid-gateway container (or the formula below) on the server side. Third-party software: libmpv and FFmpeg (LGPL) via MPVKit.

## unraid-gateway (formula)

[unraid-gateway](https://github.com/sidimam/unraid-gateway) is the server side of the **Unraid Drive** iOS/iPadOS/visionOS app: a single authenticated port that serves your shares to the Files app and proxies the Unraid API. It normally runs as a Docker container on Unraid (Community Applications); this formula builds the same Go binary for a Mac or Linux box that has the shares mounted, for example a Mac mini next to the NAS.

```bash
brew install sidimam/tap/unraid-gateway
brew services start unraid-gateway
```

**What's new in 0.10.0:** web UI redesigned — dashboard counters and tabs (Files, Activity, Devices, Notifications, API keys, Advanced), readable tables, theme system/light/dark, seven languages, a login that password managers (iCloud Keychain, Chrome, Firefox) save and fill. 0.9.x: device registry (revoke a lost phone from the web UI or `gw devices rm`), notifications for new/removed devices via Unraid, e-mail (SMTP) and Telegram, Unraid API key management and rotation from the web UI (ADMIN key), web UI one-click login with a remembered key, Activity panel, `gw activity`, console walkthrough. Full history: [Changelog](https://github.com/sidimam/unraid-gateway/wiki/Changelog).


Point `DATA_ROOT` (default `$(brew --prefix)/var/unraid-gateway/data`) at one folder per share and `UNRAID_URL` at your Unraid WebGUI; see `brew info unraid-gateway` for the caveats and the [gateway wiki](https://github.com/sidimam/unraid-gateway/wiki) for the full setup.
