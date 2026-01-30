# Калькулятор сна — PWA

Прогрессивное веб-приложение для расчёта оптимального времени сна на основе 90-минутных циклов.

## Функции

- **Режим «Проснуться в»** — выбираешь время пробуждения, получаешь варианты времени засыпания
- **Режим «Лечь сейчас»** — нажимаешь кнопку, получаешь оптимальное время пробуждения
- **Push-уведомления** — напомнит, когда пора ложиться
- **Офлайн-режим** — работает без интернета после первого открытия
- **Установка на телефон** — добавляется на домашний экран как нативное приложение
- **Тёмная/светлая тема** — переключение одной кнопкой

## Деплой на GitHub Pages

### 1. Создай репозиторий

```bash
# Создай новый репозиторий на GitHub, например: sleep-calculator
# Затем:

cd sleep-calculator
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/ТВОЙ_USERNAME/sleep-calculator.git
git push -u origin main
```

### 2. Включи GitHub Pages

1. Открой репозиторий на GitHub
2. Settings → Pages
3. Source: **Deploy from a branch**
4. Branch: **main** / **(root)**
5. Save

### 3. Дождись деплоя

Через 1-2 минуты приложение будет доступно по адресу:
```
https://ТВОЙ_USERNAME.github.io/sleep-calculator/
```

## Кастомный домен (опционально)

1. Купи домен (например, на reg.ru или namecheap)
2. В Settings → Pages → Custom domain введи свой домен
3. Добавь DNS записи:
   - CNAME: `www` → `ТВОЙ_USERNAME.github.io`
   - A записи для корневого домена:
     ```
     185.199.108.153
     185.199.109.153
     185.199.110.153
     185.199.111.153
     ```

## Структура проекта

```
sleep-calculator/
├── index.html      # Главная страница + вся логика
├── manifest.json   # PWA манифест
├── sw.js          # Service Worker
├── icons/         # Иконки приложения
│   ├── icon-72.png
│   ├── icon-96.png
│   ├── icon-128.png
│   ├── icon-144.png
│   ├── icon-152.png
│   ├── icon-192.png
│   ├── icon-384.png
│   └── icon-512.png
└── README.md
```

## Технологии

- Vanilla JS (без фреймворков)
- CSS Variables для темизации
- Service Worker для офлайн-режима
- Web Notifications API для уведомлений
- LocalStorage для сохранения настроек

## Дальнейшее развитие

- [ ] Интеграция с Apple Health / Google Fit
- [ ] Статистика качества сна
- [ ] Звуки для засыпания
- [ ] Связь с физическими продуктами (маски для сна, и т.д.)
