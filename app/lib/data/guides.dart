import 'guides_osint.dart';
import 'guides_crypto.dart';
import 'guides_social.dart';
import 'guides_geo.dart';
import 'guides_verify.dart';
import 'guides_anon.dart';
import 'guides_hygiene.dart';
import 'guides_law.dart';

class GuideSection {
  final String name;
  final List<GuideCategory> categories;
  const GuideSection(this.name, this.categories);
}

final allGuides = <GuideSection>[
  GuideSection("OSINT Tools", osintGuides),
  GuideSection("Крипта", cryptoGuides),
  GuideSection("Соцсети", socialGuides),
  GuideSection("Гео и карты", geoGuides),
  GuideSection("Верификация", verifyGuides),
  GuideSection("Анонимность", anonGuides),
  GuideSection("Цифровая гигиена", hygieneGuides),
  GuideSection("Закон и этика", lawGuides),
];