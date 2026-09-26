import 'guides_osint.dart';

const lawGuides = <GuideCategory>[
  GuideCategory("Закон и OSINT", [
    GuideItem("152-ФЗ РФ", "http://www.consultant.ru/document/cons_doc_LAW_61801/", "О персональных данных"),
    GuideItem("137 УК РФ", "https://www.consultant.ru/document/cons_doc_LAW_3894/", "Нарушение неприкосновенности частной жизни"),
    GuideItem("272 УК РФ", "https://www.consultant.ru/document/cons_doc_LAW_3894/", "Неправомерный доступ к информации"),
    GuideItem("GDPR", "https://gdpr-info.eu", "Регламент ЕС о персданных"),
    GuideItem("Bellingcat Legal", "https://www.bellingcat.com", "Практика расследований"),
    GuideItem("Access Now", "https://www.accessnow.org", "Цифровые права"),
  ]),
  GuideCategory("Этика OSINT", [
    GuideItem("Berkeley Protocol", "https://www.ohchr.org/en/publications/policy-and-methodological-publications/berkeley-protocol-digital-open-source", "Протокол ООН по OSINT"),
    GuideItem("OSINT Ethics", "https://www.bellingcat.com/resources/", "Ресурсы Bellingcat"),
    GuideItem("First Draft Ethics", "https://firstdraftnews.org", "Этика журналиста"),
    GuideItem("GIJN Ethics", "https://gijn.org", "Этика расследований"),
  ]),
  GuideCategory("Антисват", [
    GuideItem("Что делать при угрозах", "https://ssd.eff.org", "EFF: защита от слежки"),
    GuideItem("Роскомнадзор", "https://rkn.gov.ru", "Жалобы на утечки"),
    GuideItem("Киберполиция РФ", "https://мвд.рф", "Обращение в МВД"),
    GuideItem("StopNCII", "https://stopncii.org", "Удаление интимных фото"),
    GuideItem("Take It Down", "https://takeitdown.ncmec.org", "Удаление фото несовершеннолетних"),
    GuideItem("Google Removal", "https://support.google.com/websearch/troubleshooter/3111061", "Удаление из Google"),
  ]),
  GuideCategory("Защита от сваттинга", [
    GuideItem("Не паниковать", "https://ssd.eff.org", "Сначала оцените угрозу"),
    GuideItem("Сброс устройств", "https://ssd.eff.org", "Если занимались доксом — сбросьте"),
    GuideItem("Удалить аккаунты", "https://justdeleteme.xyz", "Удалите соцсети с криминалом"),
    GuideItem("Юрист", "https://www.consultant.ru", "Консультация при угрозах"),
    GuideItem("Не хранить дома", "https://ssd.eff.org", "Изъятие по ст. 81 УПК"),
  ]),
  GuideCategory("Обучение OSINT", [
    GuideItem("Bellingcat Guides", "https://www.bellingcat.com/category/resources/how-tos/", "Гайды Bellingcat"),
    GuideItem("OSINT Framework", "https://osintframework.com", "Карта инструментов"),
    GuideItem("IntelTechniques", "https://inteltechniques.com", "Майкл Баззелл"),
    GuideItem("OSINT Curious", "https://osintcurio.us", "Проект OSINT"),
    GuideItem("Trace Labs", "https://www.tracelabs.org", "OSINT для поиска людей"),
    GuideItem("Sector035", "https://sector035.nl", "Недельные дайджесты OSINT"),
    GuideItem("OSINT Dojo", "https://www.osintdojo.com", "Обучение"),
  ]),
];