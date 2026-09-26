import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme.dart';
import 'username.dart';
import 'domain.dart';
import 'url.dart';
import 'phone.dart';
import 'exif.dart';
import 'ip.dart';
import 'guides.dart';
import 'proxy.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const tgPersonal = "tg://resolve?domain=Miroswatow";
  static const tgChannel = "tg://resolve?domain=swag_t1me";

  Future<void> _openTg(BuildContext ctx, String url) async {
    final uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        return;
      }
    } catch (_) {}

    final fallback = Uri.parse(
        url.replaceFirst("tg://resolve?domain=", "https://t.me/"));
    if (await canLaunchUrl(fallback)) {
      await launchUrl(fallback, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final modules = [
      ("USERNAME", Icons.person_search, const UsernameScreen()),
      ("DOMAIN", Icons.language, const DomainScreen()),
      ("URL", Icons.link, const UrlScreen()),
      ("PHONE", Icons.phone_android, const PhoneScreen()),
      ("IP", Icons.router, const IpScreen()),
      ("EXIF", Icons.image, const ExifScreen()),
      ("GUIDES", Icons.menu_book, const GuidesScreen()),
      ("PROXY", Icons.vpn_lock, const ProxyScreen()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("[ swag_time v1.0 ]"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Center(
              child: Text("5/9",
                  style: TextStyle(
                    color: SwagColors.red,
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          ...modules.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: InkWell(
                  onTap: () => Navigator.push(
                      context, MaterialPageRoute(builder: (_) => e.$3)),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: SwagColors.surface,
                      border: Border.all(color: SwagColors.border),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Icon(e.$2, color: SwagColors.red),
                        const SizedBox(width: 14),
                        Text("[+] ${e.$1}",
                            style: const TextStyle(
                              fontFamily: 'monospace',
                              color: SwagColors.text,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.1,
                            )),
                        const Spacer(),
                        const Icon(Icons.chevron_right,
                            color: SwagColors.dim),
                      ],
                    ),
                  ),
                ),
              )),
          const SizedBox(height: 20),
          const Text("// telegram",
              style: TextStyle(
                fontFamily: 'monospace',
                color: SwagColors.red,
                fontSize: 12,
                letterSpacing: 1.2,
              )),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _openTg(context, tgPersonal),
                  icon: const Icon(Icons.person, size: 18),
                  label: const Text("НАПИСАТЬ"),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _openTg(context, tgChannel),
                  icon: const Icon(Icons.campaign, size: 18),
                  label: const Text("КАНАЛ"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text("[ swag_time ] — 5/9",
                style: TextStyle(
                  fontFamily: 'monospace',
                  color: SwagColors.dim,
                  fontSize: 11,
                )),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}