class GuideItem {
  final String title;
  final String url;
  final String desc;
  const GuideItem(this.title, this.url, this.desc);
}

class GuideCategory {
  final String name;
  final List<GuideItem> items;
  const GuideCategory(this.name, this.items);
}

const osintGuides = <GuideCategory>[
  GuideCategory("Поисковики", [
    GuideItem("DuckDuckGo", "https://duckduckgo.com", "Приватный поиск, операторы"),
    GuideItem("Mojeek", "https://www.mojeek.com", "Независимый поиск, фильтры по странам"),
    GuideItem("Baidu", "https://www.baidu.com", "Китайский поисковик"),
    GuideItem("Swisscows", "https://swisscows.com", "Семантический поиск"),
    GuideItem("Aleph (OCCRP)", "https://aleph.occrp.org", "Базы данных, реестры, утечки"),
    GuideItem("PublicWWW", "https://publicwww.com", "Поиск по исходному коду страниц"),
    GuideItem("Carrot2", "https://search.carrot2.org", "Кластеризация результатов"),
    GuideItem("FindPDFDoc", "https://findpdfdoc.com", "Поиск PDF через Google"),
    GuideItem("KeywordTool", "https://keywordtool.io", "Ключевые слова Google/YouTube"),
    GuideItem("MillionShort", "https://millionshort.com", "Убрать топ из выдачи"),
    GuideItem("BrightLocal", "https://www.brightlocal.com/local-search-results-checker/", "Локальный поиск Google"),
    GuideItem("Trove", "https://trove.nla.gov.au/search/category/websites", "Архив веб-страниц Австралии"),
    GuideItem("National Archives UK", "http://webarchive.nationalarchives.gov.uk/search/", "Архив Великобритании"),
    GuideItem("UNHCR Web Archive", "https://webarchive.archive.unhcr.org/search", "Архив ООН"),
    GuideItem("Google Autocomplete", "http://tools.digitalmethods.net/beta/scrapeGoogle/autocomplete.php", "Подсказки Google"),
  ]),
  GuideCategory("Поиск по нику", [
    GuideItem("Sherlock", "https://github.com/sherlock-project/sherlock", "Поиск ника на 400+ сайтах"),
    GuideItem("Maigret", "https://github.com/soxoj/maigret", "Поиск ника на 3000+ сайтах"),
    GuideItem("WhatsMyName", "https://whatsmyname.app", "Быстрый поиск по сотням сайтов"),
    GuideItem("NameCheckup", "https://namecheckup.com", "Поиск ника на сайтах"),
    GuideItem("InstantUsername", "https://instantusername.com", "Проверка по сайтам"),
    GuideItem("Namechk", "https://namechk.com", "Ники, домены, приложения"),
    GuideItem("BoardReader", "https://boardreader.com", "Поиск по форумам"),
    GuideItem("Social Searcher", "https://www.social-searcher.com", "Упоминания в соцсетях"),
    GuideItem("Social Mention", "https://socialmention.com", "Упоминания"),
    GuideItem("Yasni", "http://www.yasni.com", "Автопоиск по интернету"),
    GuideItem("Leak-Lookup", "https://leak-lookup.com/search", "Проверка утечек"),
  ]),
  GuideCategory("Поиск по фото", [
    GuideItem("Yandex Images", "https://yandex.ru/images/", "Лучший reverse image search"),
    GuideItem("Google Images", "https://www.google.com/imghp", "Обратный поиск Google"),
    GuideItem("Bing Visual", "https://www.bing.com/visualsearch", "Визуальный поиск Microsoft"),
    GuideItem("TinEye", "https://tineye.com", "Reverse image search"),
    GuideItem("Mail.ru Images", "https://go.mail.ru/search_images", "Поиск по картинке"),
    GuideItem("Baidu Images", "https://image.baidu.com", "Китайский поиск"),
    GuideItem("SauceNAO", "https://saucenao.com", "Поиск арта и аниме"),
    GuideItem("SearchByImage", "https://searchbyimage.app", "Товары в магазинах"),
    GuideItem("Thieve", "https://thieve.co/tools/image-search", "Товары Aliexpress"),
    GuideItem("PimEyes", "https://pimeyes.com", "Поиск по лицу (осторожно)"),
    GuideItem("Search4Faces", "https://search4faces.com", "Поиск по VK/OK/TikTok"),
    GuideItem("FaceCheck", "https://facecheck.id", "Поиск по лицу"),
  ]),
  GuideCategory("EXIF / метаданные", [
    GuideItem("ExifTool", "https://exiftool.org", "Чтение/редактирование метаданных"),
    GuideItem("Metapicz", "https://metapicz.com", "EXIF-просмотрщик"),
    GuideItem("Regex.info", "https://exif.regex.info", "Извлечение метаданных"),
    GuideItem("FotoForensics", "https://fotoforensics.com", "Анализ изображений"),
    GuideItem("Stolen Camera Finder", "https://www.stolencamerafinder.com", "Поиск по EXIF камеры"),
    GuideItem("29a.ch", "https://29a.ch/photo-forensics/", "Фото-форензика"),
    GuideItem("ForensicDots", "https://www.forensicdots.de", "Точки принтера на сканах"),
    GuideItem("Depix", "https://github.com/beurtschipper/Depix", "Депикселизация текста"),
    GuideItem("Cleanup.pictures", "https://cleanup.pictures", "Удалить объект с фото"),
    GuideItem("Waifu2x", "https://waifu2x.booru.pics", "Улучшение качества картинок"),
  ]),
  GuideCategory("Домен / IP", [
    GuideItem("WHOIS XML API", "https://tools.whoisxmlapi.com", "WHOIS-история"),
    GuideItem("SecurityTrails", "https://securitytrails.com", "DNS-история, субдомены"),
    GuideItem("VirusTotal", "https://www.virustotal.com", "Пассивный DNS, SSL"),
    GuideItem("Censys", "https://censys.io", "Серверы и устройства"),
    GuideItem("Shodan", "https://shodan.io", "Поиск устройств в сети"),
    GuideItem("DNSDumpster", "https://dnsdumpster.com", "Хосты домена"),
    GuideItem("URLScan.io", "https://urlscan.io", "Сканирование сайтов"),
    GuideItem("BuiltWith", "https://builtwith.com", "Технологии сайта"),
    GuideItem("Dnslytics", "https://dnslytics.com/reverse-analytics", "Трекеры сайта"),
    GuideItem("DomainWat.ch", "https://domainwat.ch", "WHOIS-история"),
    GuideItem("crt.sh", "https://crt.sh", "SSL-сертификаты"),
    GuideItem("HackerTarget", "https://hackertarget.com", "Бесплатные API: WHOIS, DNS"),
    GuideItem("ipinfo.io", "https://ipinfo.io", "IP-геолокация"),
    GuideItem("AbuseIPDB", "https://www.abuseipdb.com", "Репутация IP"),
    GuideItem("IP-API", "http://ip-api.com", "Бесплатная IP-геолокация"),
    GuideItem("urlscan.io", "https://urlscan.io", "Анализ URL"),
  ]),
  GuideCategory("Google Dorks", [
    GuideItem("Awesome Google Dorks", "https://github.com/Tobee1406/Awesome-Google-Dorks", "Сборник дорков"),
    GuideItem("DorkGenius", "https://dorkgenius.com", "Генератор дорков"),
    GuideItem("Dorks Faisal", "https://dorks.faisalahmed.me", "Генератор дорков Google/Яндекс"),
    GuideItem("OSINT Combine", "https://osintcombine.com", "Инструменты для поиска"),
    GuideItem("Pastebin OSINT", "https://www.secjuice.com/pastebin-incidental-osint/", "Поиск по Pastebin"),
  ]),
];