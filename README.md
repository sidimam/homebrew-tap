# sidimam/homebrew-tap

Homebrew tap for the Mac builds of [aMule Remote](https://github.com/sidimam/AmuleRemote) and [Unraid Drive](https://github.com/sidimam/unraid-drive), and for [unraid-gateway](https://github.com/sidimam/unraid-gateway), the server side of Unraid Drive. The casks install the same **Developer ID signed and notarized** DMGs published in each project's GitHub Releases; the formula builds the gateway from its tagged source.

| Package | Type | Version | Install |
|---|---|---|---|
| [aMule Remote](https://github.com/sidimam/homebrew-tap/wiki/aMule-Remote) — remote control for an aMule (`amuled`) server | cask | 1.5.1 (build 27) | `brew install --cask sidimam/tap/amule-remote` |
| [Unraid Drive](https://github.com/sidimam/homebrew-tap/wiki/Unraid-Drive) — Unraid shares in the Finder sidebar, menu bar panel | cask | 1.5.4 (build 49) | `brew install --cask sidimam/tap/unraid-drive` |
| [unraid-gateway](https://github.com/sidimam/homebrew-tap/wiki/unraid-gateway) — authenticated file API and Unraid API proxy | formula | 0.18.1 | `brew install sidimam/tap/unraid-gateway` |

Update with `brew update && brew upgrade`. Requirements: macOS 14 Sonoma or later for both apps (aMule Remote: Apple Silicon only; Unraid Drive: Apple Silicon or Intel). After installing Unraid Drive enable its extension under System Settings › General › Login Items & Extensions › File Providers.

The gateway runs as a service: write `UNRAID_URL=http://<unraid-ip>` in `$(brew --prefix)/etc/unraid-gateway/env`, link the shares under `$(brew --prefix)/var/unraid-gateway/data`, then `brew services start unraid-gateway` (web UI on port 8484). On Unraid itself use the Docker container instead.

**Documentation: [wiki](https://github.com/sidimam/homebrew-tap/wiki)** — one page per package, [Troubleshooting](https://github.com/sidimam/homebrew-tap/wiki/Troubleshooting) and [Maintainer notes](https://github.com/sidimam/homebrew-tap/wiki/Maintainer-notes). What's new in each release: the changelogs of [aMule Remote](https://github.com/sidimam/AmuleRemote/blob/main/CHANGELOG.md), [Unraid Drive](https://github.com/sidimam/unraid-drive/blob/main/CHANGELOG.md) and [unraid-gateway](https://github.com/sidimam/unraid-gateway/wiki/Changelog).
