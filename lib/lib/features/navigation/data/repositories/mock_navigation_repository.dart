import 'package:sample_web/lib/features/github/presentation/pages/github_page.dart';
import 'package:sample_web/lib/features/linkedIn/presentation/pages/linkedIn_page.dart';
import 'package:sample_web/lib/features/navigation/data/models/left_navigation_item.dart';
import 'package:sample_web/lib/features/navigation/data/repositories/inavigation_repository.dart';
import 'package:sample_web/lib/features/twitter/presentation/pages/twitter_page.dart';
import 'package:sample_web/lib/features/web/presentation/pages/web_page.dart';
import 'package:sample_web/lib/features/welcome/presentation/pages/welcome_page.dart';
import 'package:sample_web/lib/styles/personal_portfolio_icons.dart';

class MockNavigationRepository extends INavigationRepository {
  @override
  List<LeftNavigationItem> getDefaultNavItems() {
    return [
      const LeftNavigationItem(
          icon: PersonalPortfolioIcons.user, label: 'My Profile', route: WelcomePage.route, isSelected: true),
      const LeftNavigationItem(
          icon: PersonalPortfolioIcons.twitter, label: 'Twitter', route: TwitterPage.route, isSelected: false),
      const LeftNavigationItem(
          icon: PersonalPortfolioIcons.linkedin, label: 'LinkedIn', route: LinkedInPage.route, isSelected: false),
      const LeftNavigationItem(icon: PersonalPortfolioIcons.web, label: 'Web', route: WebPage.route, isSelected: false),
      const LeftNavigationItem(
          icon: PersonalPortfolioIcons.github, label: 'Github', route: GithubPage.route, isSelected: false),
    ];
  }
}
