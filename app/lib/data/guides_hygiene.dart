import 'guides_osint.dart';

const hygieneGuides = <GuideCategory>[
  GuideCategory("Проверка утечек", [
    GuideItem("HaveIBeenPwned", "https://haveibeenpwned.com", "Проверка email на утечки"),
    GuideItem("HaveIBeenPwned Passwords", "https://haveibeenpwned.com/Passwords", "Проверка пароля"),
    GuideItem("DeHashed", "https://dehashed.com", "Поиск в утечках (для своих данных)"),
    GuideItem("LeakCheck", "https://leakcheck.io", "Проверка утечек"),
    GuideItem("Leak-Lookup", "https://leak-lookup.com", "Утечки сайтов"),
    GuideItem("Firefox Monitor", "https://monitor.firefox.com", "Мониторинг утечек"),
    GuideItem("Google Password Checkup", "https://passwords.google.com/checkup", "Проверка паролей Google"),
    GuideItem("XposedOrNot", "https://xposedornot.com", "Проверка утечек email"),
  ]),
  GuideCategory("Цифровая гигиена", [
    GuideItem("Privacytools.io", "https://www.privacytools.io", "Каталог приватных сервисов"),
    GuideItem("Privacy Guides", "https://www.privacyguides.org", "Гайды по приватности"),
    GuideItem("SSD.eff.org", "https://ssd.eff.org", "Surveillance Self-Defense"),
    GuideItem("EFF", "https://www.eff.org", "Защита цифровых прав"),
    GuideItem("Terms of Service", "https://tosdr.org", "Рейтинг ToS сервисов"),
    GuideItem("DeleteMe", "https://joindeleteme.com", "Удаление данных из интернета"),
    GuideItem("JustDeleteMe", "https://justdeleteme.xyz", "Как удалить аккаунт"),
    GuideItem("Account Killer", "https://www.accountkiller.com", "Удаление аккаунтов"),
  ]),
  GuideCategory("2FA и пароли", [
    GuideItem("Bitwarden", "https://bitwarden.com", "Менеджер паролей"),
    GuideItem("KeePassXC", "https://keepassxc.org", "Локальный менеджер паролей"),
    GuideItem("1Password", "https://1password.com", "Менеджер паролей"),
    GuideItem("Aegis Authenticator", "https://getaegis.app", "2FA на Android"),
    GuideItem("YubiKey", "https://www.yubico.com", "Аппаратный 2FA-ключ"),
    GuideItem("Authy", "https://authy.com", "2FA"),
  ]),
  GuideCategory("Приватные браузеры", [
    GuideItem("Brave", "https://brave.com", "Браузер с блокировкой трекеров"),
    GuideItem("Firefox", "https://www.mozilla.org/firefox/", "Открытый браузер"),
    GuideItem("Tor Browser", "https://www.torproject.org", "Анонимный браузер"),
    GuideItem("Mullvad Browser", "https://mullvad.net/browser", "Приватный браузер"),
    GuideItem("LibreWolf", "https://librewolf.net", "Форк Firefox без телеметрии"),
  ]),
  GuideCategory("Расширения приватности", [
    GuideItem("uBlock Origin", "https://ublockorigin.com", "Блокировщик рекламы"),
    GuideItem("Privacy Badger", "https://privacybadger.org", "Блокировщик трекеров EFF"),
    GuideItem("HTTPS Everywhere", "https://www.eff.org/https-everywhere", "Принудительный HTTPS"),
    GuideItem("Decentraleyes", "https://decentraleyes.org", "Локальные CDN"),
    GuideItem("ClearURLs", "https://docs.clearurls.xyz", "Удаление трекинга из URL"),
  ]),
  GuideCategory("Метаданные", [
    GuideItem("ExifTool", "https://exiftool.org", "Просмотр/удаление EXIF"),
    GuideItem("ImageOptim", "https://imageoptim.com", "Сжатие без EXIF"),
    GuideItem("Scrambled Exif", "https://f-droid.org/packages/com.jarsilio.android.scrambledeggsif/", "Удаление EXIF на Android"),
  ]),
];