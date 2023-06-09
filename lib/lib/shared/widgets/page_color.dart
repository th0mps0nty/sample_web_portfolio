import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_web/lib/shared/providers/shared_providers.dart';

class PageColor extends ConsumerWidget {
  const PageColor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageGradient = ref.watch(pageColorProvider);
    return Container(
      decoration: BoxDecoration(
        gradient: pageGradient,
      ),
    );
  }
}
