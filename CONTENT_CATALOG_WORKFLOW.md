# Mag Mechanic 2 Content Catalog

Каталог рекомендаций хранится в GitHub:

- JSON: `content-catalog.json`
- raw URL: `https://raw.githubusercontent.com/xenk12/MagMechanic2-client/main/content-catalog.json`

Лаунчер `1.3.8+` читает этот файл и показывает его в окне `Контент`.

## Разделы

- `recommended-mods` -> папка Minecraft `mods`
- `resourcepacks` -> папка Minecraft `resourcepacks`
- `shaderpacks` -> папка Minecraft `shaderpacks`

## Пример элемента

```json
{
  "name": "Example Mod",
  "description": "Коротко зачем этот мод нужен.",
  "version": "1.0.0",
  "fileName": "example-mod.jar",
  "url": "https://example.com/example-mod.jar",
  "pageUrl": "https://example.com/mod-page",
  "sha256": "",
  "size": 0,
  "recommended": true
}
```

`url` используется кнопкой `Скачать`. `pageUrl` используется кнопкой `Ссылка`. Если `fileName` не указан, лаунчер попробует взять имя файла из `url`.

## Как обновлять

1. В `MagMechanicNewsAdmin` нажми `Catalog`.
2. Добавь элементы в нужную секцию.
3. Сохрани файл.
4. Нажми `Cat GitHub`.

После публикации лаунчер начнёт читать обновлённый каталог с GitHub.
