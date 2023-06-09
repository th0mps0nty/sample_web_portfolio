import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_web/lib/features/welcome/data/repositories/iwelcome_repository.dart';
import 'package:sample_web/lib/features/welcome/data/repositories/mock_welcome_repository.dart';
import 'package:sample_web/lib/features/welcome/presentation/viewmodels/greetings_viewmodel.dart';
import 'package:sample_web/lib/features/welcome/presentation/viewmodels/welcome_viewmodel.dart';

final welcomeRepositoryProvider = Provider<IWelcomeRepository>((ref) {
  return MockWelcomeRepository();
});

final welcomeViewModelProvider = Provider<WelcomePageViewModel>((ref) {
  var repository = ref.read(welcomeRepositoryProvider);
  return WelcomePageViewModel(repository, ref);
});

final welcomeProvider = FutureProvider((ref) {
  final welcomeVM = ref.read(welcomeViewModelProvider);
  return welcomeVM.getWelcomePageData();
});

final greetingsRawListProvider = StateProvider<List<String>>((ref) {
  return [];
});

final greetingsViewModelProvider = StateNotifierProvider<GreetingsViewModel, String>((ref) {
  var greetings = ref.watch(greetingsRawListProvider);
  return GreetingsViewModel(greetings.first, greetings);
});