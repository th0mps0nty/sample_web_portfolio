import 'package:go_router/go_router.dart';
import 'package:sample_web/lib/features/shell/presentation/pages/portfolio_main.dart';
import 'package:sample_web/lib/features/splash/presentation/splash_page.dart';
import 'package:sample_web/lib/features/welcome/presentation/pages/welcome_page.dart';
import 'package:sample_web/lib/helpers/utils.dart';

class AppRoutes {
  static final router = GoRouter(
    initialLocation: SplashPage.route,
    navigatorKey: Utils.mainNav,
    routes: [
      GoRoute(
        parentNavigatorKey: Utils.mainNav,
        path: SplashPage.route,
        builder: (context, state) => const SplashPage(),
      ),
      ShellRoute(
        navigatorKey: Utils.tabNav,
        builder: (context, state, child) =>
            // pages get injected here
            PortfolioMainPage(child: child),
        routes: [
          // all nested routes go here
          GoRoute(
            parentNavigatorKey: Utils.tabNav,
            path: WelcomePage.route,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: WelcomePage(),
            ),
          ),
        ], // routes
      ),
    ], //routes
  );
}
