import 'package:sample_web/lib/features/welcome/data/models/welcome_page_model.dart';

abstract class IWelcomeRepository {
  Future<WelcomePageModel> getWelcomePageData();
}
