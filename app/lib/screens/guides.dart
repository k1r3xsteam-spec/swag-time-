import 'package:flutter/material.dart';
import '../data/guides.dart';
import '../data/guides_osint.dart';
import '../theme.dart';
import 'guide_detail.dart';

class GuidesScreen extends StatefulWidget {
  const GuidesScreen({super.key});
  @override
  State<GuidesScreen> createState() => _S();
}

class _S extends State<GuidesScreen> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    final q = query.toLowerCase();

    return Scaffold(
      appBar: AppBar(title: const Text("[ guides ]")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: (v) => setState(() => query = v),
              style: const TextStyle(
                  fontFamily: 'monospace', color: SwagColors.text),
              decoration: const InputDecoration(
                labelText: "> поиск по гайдам",
                prefixIcon: Icon(Icons.search, color: SwagColors.red),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: allGuides.length,
              itemBuilder: (_, i) {
                final section = allGuides[i];
                final filtered = <GuideCategory>[];
                for (final cat in section.categories) {
                  final items = cat.items.where((it) {
                    if (q.isEmpty) return true;
                    return it.title.toLowerCase().contains(q) ||
                        it.desc.toLowerCase().contains(q) ||
                        cat.name.toLowerCase().contains(q);
                  }).toList();
                  if (items.isNotEmpty) {
                    filtered.add(GuideCategory(cat.name, items));
                  }
                }
                if (filtered.isEmpty) return const SizedBox.shrink();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 6),
                      child: Text("// ${section.name}",
                          style: const TextStyle(
                            fontFamily: 'monospace',
                            color: SwagColors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.1,
                          )),
                    ),
                    ...filtered.map((cat) => ExpansionTile(
                          tilePadding: EdgeInsets.zero,
                          title: Text(cat.name,
                              style: const TextStyle(
                                fontFamily: 'monospace',
                                color: SwagColors.text,
                                fontWeight: FontWeight.w600,
                              )),
                          children: cat.items
                              .map((it) => ListTile(
                                    dense: true,
                                    title: Text(it.title,
                                        style: const TextStyle(
                                            fontFamily: 'monospace',
                                            color: SwagColors.text)),
                                    subtitle: Text(it.desc,
                                        style: const TextStyle(
                                            fontFamily: 'monospace',
                                            color: SwagColors.dim,
                                            fontSize: 11)),
                                    trailing: const Icon(Icons.chevron_right,
                                        color: SwagColors.red),
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            GuideDetailScreen(item: it),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        )),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}