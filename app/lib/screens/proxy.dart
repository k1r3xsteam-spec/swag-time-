import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/guides_proxy.dart';
import '../theme.dart';

class ProxyScreen extends StatelessWidget {
  const ProxyScreen({super.key});

  Future<void> _connect(BuildContext ctx, ProxyItem p) async {
    // Сначала пробуем tg://
    final tgUri = Uri.parse(p.tgLink);
    try {
      if (await canLaunchUrl(tgUri)) {
        await launchUrl(tgUri, mode: LaunchMode.externalApplication);
        return;
      }
    } catch (_) {}

    // Fallback на https://t.me/proxy
    final webUri = Uri.parse(p.webLink);
    try {
      if (await canLaunchUrl(webUri)) {
        await launchUrl(webUri, mode: LaunchMode.externalApplication);
        return;
      }
    } catch (_) {}

    if (ctx.mounted) {
      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(content: Text("Не удалось открыть Telegram")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("[ telegram proxy ]")),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: SwagColors.surface,
              border: Border.all(color: SwagColors.red),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              "[!] Публичные прокси. Владелец видит IP и может логировать метаданные. Для параноиков — свой VPS.",
              style: TextStyle(
                fontFamily: 'monospace',
                color: SwagColors.red,
                fontSize: 11,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: telegramProxies.length,
              separatorBuilder: (_, __) => const SizedBox(height: 6),
              itemBuilder: (_, i) {
                final p = telegramProxies[i];
                return InkWell(
                  onTap: () => _connect(context, p),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: SwagColors.surface,
                      border: Border.all(color: SwagColors.border),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.vpn_lock,
                            color: SwagColors.red, size: 20),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${p.server}:${p.port}",
                                  style: const TextStyle(
                                    fontFamily: 'monospace',
                                    color: SwagColors.text,
                                    fontSize: 12,
                                  )),
                              Text(p.secret.substring(0, 16) + "...",
                                  style: const TextStyle(
                                    fontFamily: 'monospace',
                                    color: SwagColors.dim,
                                    fontSize: 10,
                                  )),
                            ],
                          ),
                        ),
                        const Icon(Icons.chevron_right, color: SwagColors.red),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}