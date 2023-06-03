import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_web/lib/features/welcome/data/models/welcome_page_model.dart';
import 'package:sample_web/lib/features/welcome/data/repositories/iwelcome_repository.dart';
import 'package:sample_web/lib/features/welcome/presentation/providers/welcome_page_providers.dart';

class WelcomePageViewModel {
  final Ref ref;
  final IWelcomeRepository welcomeRepository;

  WelcomePageViewModel(this.welcomeRepository, this.ref);

  Future<WelcomePageModel> getWelcomePageData() async {
    var welcomePageData = await welcomeRepository.getWelcomePageData();
    ref.read(greetingsRawListProvider.notifier).state = welcomePageData.greetings;
    return welcomePageData;
  }
}
