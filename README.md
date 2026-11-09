# MagMechanic2-client

Public download repository for Mag Mechanic 2 launcher files.

## Актуальная задача для Codex (09.11.2026)

- **[Обновление сборки: ревизия модов, Let it Walk, Create Encased и баки произвольной формы](docs/LAUNCHER_MODPACK_UPDATE_TZ_RU.md)** — основное текущее ТЗ. Проверять настоящие версии и совместимость, готовить минимальные фиксы в лаборатории и только затем публикацию.
- [Архив диагностики Guard/Playit/HTTPS и сети игроков](docs/LAUNCHER_GUARD_HTTPS_HOTFIX_TZ_RU.md) — сохранённые симптомы, проверенные факты и ограничения; не путать с текущим заданием.

## Release assets to upload

Upload these files manually to the matching releases if they are missing.

### `launcher-1.3.6`

Upload from:

- `C:\Users\grife\Documents\Codex\2026-05-06\files-mentioned-by-the-user-chatgpt\MagMechanicLauncher\installer\MagMechanicLauncher_Setup.exe`
- `C:\Users\grife\Documents\Codex\2026-05-06\files-mentioned-by-the-user-chatgpt\MagMechanicLauncher\installer\MagMechanicLauncher_Portable.zip`

Launcher update manifest:

- `launcher-update.json`
- raw URL: `https://raw.githubusercontent.com/xenk12/MagMechanic2-client/main/launcher-update.json`

### `mods-20260702`

Upload all `.jar` files from:

`C:\Users\grife\AppData\Roaming\MagMechanic2Launcher\game\mods`

Client mod manifest:

- `player-mods.json`
- raw URL: `https://raw.githubusercontent.com/xenk12/MagMechanic2-client/main/player-mods.json`

The file names in the release must stay exactly the same as in `player-mods.json`, otherwise the launcher will get 404 errors.

### `mods-20260809`

This release contains the August 9 compatibility-tested batch for Minecraft
1.21.1 / NeoForge 21.1.230: Iron's Spells and its dependencies/addons, Create:
Mobile Packages, Create Propulsion 1.1.5, MagMechanic Content and the Struts
server fix. The authoritative file names, sizes and SHA-256 hashes are stored in
`player-mods.json`.
