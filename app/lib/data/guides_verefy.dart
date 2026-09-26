import 'guides_osint.dart';

const verifyGuides = <GuideCategory>[
  GuideCategory("Факт-чекинг", [
    GuideItem("Google Fact Check", "https://toolbox.google.com/factcheck/explorer", "Проверка фактов"),
    GuideItem("Bellingcat", "https://www.bellingcat.com", "Расследования"),
    GuideItem("Snopes", "https://www.snopes.com", "Факт-чекинг"),
    GuideItem("FactCheck.org", "https://www.factcheck.org", "Факт-чекинг США"),
    GuideItem("PolitiFact", "https://www.politifact.com", "Факт-чекинг"),
  ]),
  GuideCategory("Проверка даты", [
    GuideItem("Wolfram Alpha", "https://www.wolframalpha.com", "Погода в место+дата"),
    GuideItem("SunCalc", "https://www.suncalc.org", "Положение солнца"),
    GuideItem("Time and Date", "https://www.timeanddate.com", "Даты, время"),
    GuideItem("YouTube Metadata", "https://mattw.io/youtube-metadata/", "Метаданные видео"),
  ]),
  GuideCategory("Проверка места", [
    GuideItem("Google Street View", "https://www.google.com/maps", "Панорамы улиц"),
    GuideItem("Yandex Panoramas", "https://yandex.ru/maps", "Панорамы РФ"),
    GuideItem("Mapillary", "https://www.mapillary.com", "Краудсорсные панорамы"),
    GuideItem("KartaView", "https://kartaview.org", "Открытые панорамы"),
    GuideItem("Bellingcat OSM", "https://osm-search.bellingcat.com", "Поиск объектов"),
    GuideItem("Overpass Turbo", "https://overpass-turbo.eu", "Запросы к OSM"),
  ]),
  GuideCategory("Проверка фото", [
    GuideItem("FotoForensics", "https://fotoforensics.com", "Анализ на манипуляции"),
    GuideItem("29a.ch", "https://29a.ch/photo-forensics/", "Фото-форензика"),
    GuideItem("Image Verification Assistant", "https://www.imageforensic.org", "Forensically"),
    GuideItem("Deepware Scanner", "https://scanner.deepware.ai", "Детектор дипфейков"),
    GuideItem("Sensity AI", "https://sensity.ai", "Детектор дипфейков"),
    GuideItem("AI or Not", "https://www.aiornot.com", "AI-генерация"),
    GuideItem("Hive Moderation", "https://hivemoderation.com/ai-generated-content-detection", "AI-детектор"),
  ]),
  GuideCategory("Проверка видео", [
    GuideItem("InVID", "https://www.invid-project.eu/tools-and-services/invid-verification-plugin/", "Расширение для видео"),
    GuideItem("YouTube DataViewer", "https://citizenevidence.amnestyusa.org", "Amnesty YouTube"),
    GuideItem("Forensically", "https://29a.ch/photo-forensics/", "Анализ видео"),
  ]),
  GuideCategory("OSINT-верификация", [
    GuideItem("First Draft", "https://firstdraftnews.org", "Обучение верификации"),
    GuideItem("Bellingcat Guides", "https://www.bellingcat.com/category/resources/how-tos/", "Гайды Bellingcat"),
    GuideItem("GIJN", "https://gijn.org", "Глобальная сеть журналистов"),
    GuideItem("Online Verification", "https://onlineverification.org", "Курсы верификации"),
  ]),
];