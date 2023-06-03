import 'package:sample_web/lib/features/welcome/data/models/welcome_page_model.dart';
import 'package:sample_web/lib/features/welcome/data/repositories/iwelcome_repository.dart';

class MockWelcomeRepository implements IWelcomeRepository {
  @override
  Future<WelcomePageModel> getWelcomePageData() {
    return Future.delayed(const Duration(seconds: 2), () {
      return WelcomePageModel(
          name: 'Tyler Thompson',
          title: 'Flutter Developer',
          subTitle: 'Certified Full Stack Developer',
          imgPath:
              'https://avatars.githubusercontent.com/u/22359488?s=400&u=69916e7510df648f7e70f97fe5bd1ac437023a6e&v=4',
          greetings: ["hello", "hola", "bonjour", "ciao"]);
    });
  }
}
