import 'package:go_router/go_router.dart';
import 'package:sample_web/lib/features/error/presentation/pages/error_page.dart';
import 'package:sample_web/lib/features/github/presentation/pages/github_page.dart';
import 'package:sample_web/lib/features/linkedIn/presentation/pages/linkedIn_page.dart';
import 'package:sample_web/lib/features/shell/presentation/pages/portfolio_main.dart';
import 'package:sample_web/lib/features/splash/presentation/splash_page.dart';
import 'package:sample_web/lib/features/twitter/presentation/pages/twitter_page.dart';
import 'package:sample_web/lib/features/web/presentation/pages/web_page.dart';
import 'package:sample_web/lib/features/welcome/presentation/pages/welcome_page.dart';
import 'package:sample_web/lib/helpers/utils.dart';

class AppRoutes {
  static final router = GoRouter(
    initialLocation: SplashPage.route,
    navigatorKey: Utils.mainNav,
    errorBuilder: (context, state) => ErrorPage(errorMessage: state.error.toString()),
    routes: [
      GoRoute(
        parentNavigatorKey: Utils.mainNav,
        path: SplashPage.route,
        builder: (context, state) => const SplashPage(),
      ),
      ShellRoute(
          navigatorKey: Utils.tabNav,
          builder: (context, state, child) {
            return PortfolioMainPage(child: child);
          },
          routes: [
            GoRoute(
                parentNavigatorKey: Utils.tabNav,
                path: WelcomePage.route,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(child: WelcomePage());
                }),
            GoRoute(
                parentNavigatorKey: Utils.tabNav,
                path: TwitterPage.route,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(child: TwitterPage());
                }),
            GoRoute(
                parentNavigatorKey: Utils.tabNav,
                path: LinkedInPage.route,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(child: LinkedInPage());
                }),
            GoRoute(
                parentNavigatorKey: Utils.tabNav,
                path: GithubPage.route,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(child: GithubPage());
                }),
            GoRoute(
                parentNavigatorKey: Utils.tabNav,
                path: WebPage.route,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(child: WebPage());
                }),
          ]),
    ], //routes
  );
}
