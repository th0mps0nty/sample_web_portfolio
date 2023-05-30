import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_web/lib/features/navigation/data/models/left_navigation_item.dart';
import 'package:sample_web/lib/features/navigation/presentation/providers/navigation_providers.dart';

class LeftNavigationItemTile extends ConsumerWidget {
  final LeftNavigationItem item;
  const LeftNavigationItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var navItemColor = item.isSelected ? Colors.white : Colors.white.withOpacity(0.25);

    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: IconButton(
        iconSize: 30,
        icon: Icon(
          item.icon,
          color: navItemColor,
        ),
        onPressed: () => ref.read(navigationItemsViewModelProvider.notifier).selectNavItem(item),
      ),
    );
  }
}
