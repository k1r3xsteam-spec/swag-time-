
OSINT-инструмент для Android. Работает **только с официальными API и открытыми данными.**

## Модули

| Модуль | Источник | Что даёт |
|---|---|---|
| Username | Sherlock (self-hosted) | Где занят ник |
| Email | HaveIBeenPwned | Утечки |
| Domain | WHOIS + DNS | Владелец, NS, MX, TXT |
| URL | URLScan + Shodan | Репутация ссылок |
| Phone | Numverify | Инфо о номере |
| EXIF | ExifTool | Метаданные фото |

## Стек

- Backend: Python 3.11 + FastAPI
- Клиент: Flutter 3.22 (Android)
- Сборка: GitHub Actions → APK в Artifacts

## Сборка APK

1. Зайди в **Actions** репозитория
2. Открой последний run **Build APK**
3. Скачай артефакт **swag-time-apk**
4. Установи `app-*-release.apk` на телефон

## Запуск backend локально

```bash
cd backend
python -m venv venv && source venv/bin/activate
pip install -r requirements.txt sherlock-project
sudo apt install libimage-exiftool-perl
cp .env.example .env
uvicorn main:app --reload