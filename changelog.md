# Registro delle modifiche — homebrew-tap (sidimam/tap)

Una voce per ogni modifica, la più recente in alto, raggruppate per giorno. Serve a ricostruire lo stato del progetto
senza rileggere le conversazioni: ogni commit aggiunge qui la sua voce (cosa, perché, dove, come è stato provato).
Le voci fino al 16/11/2026 sono ricostruite dalla storia git (messaggio del commit e hash).

## 2026-11-16
- Nuovo `changelog.md`: storia ricostruita dai commit (strumento `tools/changelog_da_git.sh` della cartella Claude); da qui in poi ogni commit aggiunge la sua voce in cima.

## 2026-11-12
- unraid-gateway 0.18.1: index subtree queries, journal prune (`8370de7`)

## 2026-11-11
- unraid-gateway 0.18.0 revision 1: the service loads etc/unraid-gateway/env (UNRAID_URL is required) and keeps its state under var/unraid-gateway/config; README points to the new wiki (`dcc81c0`)

## 2026-11-09
- unraid-drive 1.5.4 (build 49): two columns on iPad/Vision Pro/iPhone Duo, hinge deck (`d7dc117`)

## 2026-11-02
- amule-remote 1.5.1 (build 27): lower idle CPU, password in the server profile (`e3d25cd`)

## 2026-11-01
- unraid-drive 1.5.3 (build 48): credentials in the profile, synced with iCloud (`b51d42d`)

## 2026-10-25
- unraid-drive 1.5.2,47 (`de0d331`)

## 2026-10-22
- unraid-gateway 0.18.0 (`1c2c33d`)
- unraid-gateway 0.17.0 (`750a151`)
- unraid-drive 1.5.1,46 (`3f70a4b`)
- unraid-gateway 0.16.0 (`65484d1`)
- unraid-gateway 0.15.0 (`1d97049`)

## 2026-10-21
- unraid-drive 1.5,45 (`4ee4832`)
- unraid-gateway 0.14.0 (`40e5d74`)
- amule-remote 1.5,26 (iPhone Duo layouts, server lists, Continuity, settings backup) (`3d3386e`)

## 2026-10-14
- unraid-drive 1.4.2,44 (`e87b822`)
- unraid-gateway 0.13.0 (`4f623ba`)

## 2026-10-09
- unraid-drive 1.4.1,43 (`9f880bf`)

## 2026-10-08
- unraid-gateway 0.12.2 (`0605f0f`)
- unraid-gateway 0.12.1 (`fdc2802`)
- unraid-drive 1.4,42 (`9736d0f`)

## 2026-09-30
- unraid-drive 1.3.2,41 (`c8bf888`)
- amule-remote 1.4.4,24 (Liquid Glass icon, iPhone Duo review) (`05edbc4`)

## 2026-09-16
- amule-remote 1.4.3,23 (built with Xcode 27 and the 27.0 SDKs) (`2b16547`)

## 2026-09-15
- unraid-drive 1.3.1,40 (Developer ID build reads the synced iCloud Drive folder) (`7bed559`)
- unraid-drive 1.3.1,39 (iCloud Documents entitlement restored) (`dbbad4d`)
- unraid-drive 1.3.1,38: DMG rebuilt with the iCloud container entitlement (new sha) (`f0e5baf`)
- unraid-drive cask: drop the deprecated postflight relaunch (Homebrew 7 sandbox cannot launch apps); caveat asks to reopen the app (`d025cde`)
- unraid-drive 1.3.1,38 (`91ae732`)
- unraid-drive 1.3,37 (`35d67bf`)

## 2026-09-14
- unraid-drive cask: keep the legacy postflight relaunch (postflight_steps run sandboxed and cannot open apps) (`45dc57a`)
- unraid-drive cask: postflight_steps instead of the deprecated postflight block (Homebrew 7) (`680373f`)

## 2026-09-12
- amule-remote cask 1.4.2,22 — Apple TV remote focus and password keyboard, dialogs anchored to the tapped row, dynamic text sizes (`dc4f891`)
- README: what's new in aMule Remote 1.4.2 (`b981f39`)
- unraid-gateway formula 0.11.0 — notifications through Unraid's spool (`485c071`)
- unraid-drive cask 1.3,36 — explorer first, gear for server settings, system fonts (`c3b8e9b`)
- unraid-gateway formula 0.10.0 — redesigned web UI (`ce2cc22`)
- unraid-drive cask 1.3,35 — transient network retries (`141ea18`)
- unraid-drive cask 1.3,34 — automatic Files/Finder location check and rebuild (`4d32c1f`)
- unraid-drive cask: quit the app before upgrading (the Finder location broke when the bundle was swapped under the running extension) and relaunch it afterwards (`cb73573`)
- unraid-drive cask 1.3,33 — multi-selection, Download, Mac start without a window (`26e5f09`)
- unraid-drive cask 1.3,32 — Move/Copy destination confirmation, single Open entry (`55053ad`)

## 2026-09-11
- unraid-drive cask 1.3,31 — Mac mpv crash (LuaJIT under the hardened runtime) fixed (`bf0f85b`)
- unraid-drive cask 1.3,30 — restore first from iCloud, same device after a reinstall, Apple TV multi-server pairing, mpv diagnosis (`2347fd7`)
- amule-remote cask 1.4.1,21 — Apple TV iCloud entitlements fix, patient iCloud backup search, color dots (`62ec698`)
- amule-remote cask 1.4,20 — Apple TV iCloud entitlements fix, patient iCloud backup search, color dots (`881a3c7`)
- unraid-drive cask 1.3,29 (`a4d57c8`)
- unraid-gateway 0.9.0 (`7855705`)
- unraid-drive cask 1.3,28 (`75ac033`)
- unraid-gateway 0.7.0 (`24e4137`)
- unraid-drive cask 1.3,27 (`216f428`)
- unraid-gateway 0.6.0 (`d980907`)
- unraid-drive cask 1.2,23 (`604920c`)
- unraid-drive cask 1.2,22 (`35726b6`)
- unraid-gateway 0.5.5 (`2ff2606`)
- amule-remote cask 1.4,19 — walkthrough with iCloud restore, system-level notifications, app color, clipboard links, Apple TV keyboard fix (`ced5f87`)
- README: what's new in aMule Remote 1.4, Apple TV in the description (`0d66db4`)
- README: what's new in Unraid Drive 1.1 (`0a7120a`)
- unraid-drive cask 1.1,20 (`9bd54bd`)
- unraid-drive cask 1.0,19 (`be56ada`)

## 2026-09-09
- unraid-drive cask: symbol form for depends_on macos (`85c1b0c`)
- unraid-drive cask 1.0,17 (notarized DMG from GitHub Releases) (`daa2126`)
- amule-remote 1.3,18 (`127ed18`)
- unraid-gateway 0.5.4 (`2d65dc0`)
- Add unraid-gateway formula (v0.4.0) (`faded0a`)

## 2026-09-08
- amule-remote: repository renamed to AmuleRemote (`e818c77`)
- amule-remote: use symbol form for depends_on macos (`5a08543`)
- Add amule-remote cask (1.2, build 17) (`8c91621`)
