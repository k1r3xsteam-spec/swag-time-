import 'guides_osint.dart';

const cryptoGuides = <GuideCategory>[
  GuideCategory("Bitcoin Explorers", [
    GuideItem("Blockchain.com", "https://www.blockchain.com/explorer", "Все транзакции"),
    GuideItem("Blockchair", "https://blockchair.com", "Транзакции, статистика"),
    GuideItem("BlockCypher", "https://live.blockcypher.com", "Транзакции"),
    GuideItem("OXT.me", "https://oxt.me", "Кластеры, графы (ПК)"),
    GuideItem("WalletExplorer", "https://www.walletexplorer.com", "Кластеры адресов"),
    GuideItem("BitInfoCharts", "https://bitinfocharts.com", "Статистика, графики"),
    GuideItem("C-hound.ai", "https://c-hound.ai", "Визуализация транзакций"),
    GuideItem("KYCP.org", "https://kycp.org", "Проверка приватности"),
    GuideItem("BitcoinWhosWho", "https://bitcoinwhoswho.com", "Проверка адреса на скам"),
    GuideItem("BitcoinAbuse", "https://www.bitcoinabuse.com", "Жалобы на адреса"),
    GuideItem("CheckBitcoinAddress", "https://checkbitcoinaddress.com", "Упоминания адреса"),
    GuideItem("Blocksherlock", "https://blocksherlock.com", "Фреймворк расследований"),
    GuideItem("Breadcrumbs", "https://www.breadcrumbs.app", "Графы транзакций"),
  ]),
  GuideCategory("Ethereum Explorers", [
    GuideItem("Etherscan", "https://etherscan.io", "Анализ ETH-адреса"),
    GuideItem("Etherchain", "https://etherchain.org", "Анализ ETH"),
    GuideItem("Blockchair ETH", "https://blockchair.com/ethereum", "Транзакции"),
    GuideItem("Ethtective", "https://ethtective.com", "Граф транзакций"),
  ]),
  GuideCategory("Altcoins", [
    GuideItem("BlockCypher Dash", "https://live.blockcypher.com/dash/", "Dash-транзакции"),
    GuideItem("BlockCypher Doge", "https://live.blockcypher.com/doge/", "Doge-транзакции"),
    GuideItem("Blockchair LTC", "https://blockchair.com/litecoin", "Litecoin"),
    GuideItem("Coin360", "https://coin360.com", "Обзор всех монет"),
  ]),
  GuideCategory("Инструменты", [
    GuideItem("CryptocurrencyAlerting", "https://cryptocurrencyalerting.com/wallet-watch.html", "Уведомления об изменении баланса"),
    GuideItem("IntelX Bitcoin", "https://intelx.io/tools?tab=bitcoin", "Упоминания в утечках"),
    GuideItem("LearnMeABitcoin", "https://learnmeabitcoin.com/tools/path/", "Путь между кошельками"),
    GuideItem("AddressChecker", "https://addresschecker.eu", "Баланс списка адресов"),
    GuideItem("Blockpath", "https://blockpath.com", "Граф транзакций"),
    GuideItem("Crystal Blockchain", "https://explorer.crystalblockchain.com", "Граф, владелец кошелька"),
    GuideItem("SanctionsSearch", "https://sanctionssearch.ofac.treas.gov", "Санкционный список США"),
  ]),
  GuideCategory("Обучение", [
    GuideItem("DataWalk Crypto 101", "https://datawalk.com", "PDF по крипто-расследованиям"),
    GuideItem("Bitcoin Investigation Manual", "https://www.amazon.com/Bitcoin-Investigation-Manual-AML-Money-Laundering/dp/1077484070", "Книга по расследованиям"),
    GuideItem("GlassChain", "https://glasschain.org", "Инструмент для анализа"),
    GuideItem("Video-based Cryptanalysis", "https://www.nassiben.com/video-based-crypta", "Анализ крипты по видео"),
  ]),
];