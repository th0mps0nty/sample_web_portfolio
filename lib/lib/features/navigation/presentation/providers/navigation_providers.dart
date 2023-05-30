import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_web/lib/features/navigation/data/models/left_navigation_item.dart';
import 'package:sample_web/lib/features/navigation/data/repositories/inavigation_repository.dart';
import 'package:sample_web/lib/features/navigation/data/repositories/mock_navigation_repository.dart';
import 'package:sample_web/lib/features/navigation/presentation/viewmodels/left_navigation_viewmodel.dart';

final navigationRepositoryProvider = Provider<INavigationRepository>((ref) {
  return MockNavigationRepository();
});

final navigationItemsProvider = Provider<List<LeftNavigationItem>>((ref) {
  return ref.read(navigationRepositoryProvider).getDefaultNavItems();
});

final navigationItemsViewModelProvider =
    StateNotifierProvider<LeftNavigationViewModel, List<LeftNavigationItem>>((ref) {
  var items = ref.read(navigationItemsProvider);
  return LeftNavigationViewModel(items, ref);
});
