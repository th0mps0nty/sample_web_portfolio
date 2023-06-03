import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_web/lib/features/navigation/data/models/left_navigation_item.dart';
import 'package:sample_web/lib/helpers/utils.dart';
import 'package:sample_web/lib/shared/providers/shared_providers.dart';
import 'package:sample_web/lib/styles/personal_portfolio_colors.dart';

class LeftNavigationViewModel extends StateNotifier<List<LeftNavigationItem>> {
  final Ref ref;
  LeftNavigationViewModel(List<LeftNavigationItem> items, this.ref) : super([]) {
    state = items;

    var item = state.first;
    selectNavItem(item);
  }

  void selectNavItem(LeftNavigationItem item) {
    if (item.route.isNotEmpty) {
      GoRouter.of(Utils.tabNav.currentContext!).go(item.route);
    }

    ref.read(pageColorProvider.notifier).state = PersonalPortfolioColors.pageColor[item.route]!;
    state = [for (var element in state) element.copyWith(isSelected: item == element)];
  }
}
