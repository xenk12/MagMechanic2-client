# Mag Mechanic 2 News Workflow

Новости лаунчера хранятся в этом репозитории:

- JSON: `news/news.json`
- медиа: `news/media/*`
- raw URL для лаунчера: `https://raw.githubusercontent.com/xenk12/MagMechanic2-client/main/news/news.json`

## Как обновлять новости

1. Открой `MagMechanicNewsAdmin`.
2. Выбери локальную папку `repository/news`, где лежит `news.json` и папка `media`.
3. Создай или измени новость.
4. Нажми `Сохранить`.
5. Нажми кнопку `GitHub`.

Инструмент запустит `Publish-News-To-GitHub.ps1`, загрузит `news/news.json` и файлы из `news/media` в GitHub. Ссылки на медиа внутри JSON будут заменены на raw GitHub URL.

## Важно

- `news.json` должен быть UTF-8 без BOM.
- Картинки и GIF лучше класть в `repository/news/media`.
- Видео можно добавлять, но лучше не держать большие файлы в GitHub raw. Для больших видео лучше использовать отдельный внешний хостинг и вставлять прямую ссылку.
- Новая версия лаунчера `1.3.7` читает новости напрямую с GitHub.
- Guard на сервере может отдавать `/news` из GitHub через настройку `newsManifestUrl` в `config/mag_mechanic_guard/guard.properties`.
