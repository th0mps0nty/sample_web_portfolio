import 'package:flutter/material.dart';
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
                pageBuilder: (context, state) =>
                    AppRoutes.pageTransition(key: state.pageKey, page: const WelcomePage())),
            GoRoute(
                parentNavigatorKey: Utils.tabNav,
                path: TwitterPage.route,
                pageBuilder: (context, state) =>
                    AppRoutes.pageTransition(key: state.pageKey, page: const TwitterPage())),
            GoRoute(
                parentNavigatorKey: Utils.tabNav,
                path: LinkedInPage.route,
                pageBuilder: (context, state) =>
                    AppRoutes.pageTransition(key: state.pageKey, page: const LinkedInPage())),
            GoRoute(
                parentNavigatorKey: Utils.tabNav,
                path: GithubPage.route,
                pageBuilder: (context, state) =>
                    AppRoutes.pageTransition(key: state.pageKey, page: const GithubPage())),
            GoRoute(
                parentNavigatorKey: Utils.tabNav,
                path: WebPage.route,
                pageBuilder: (context, state) => AppRoutes.pageTransition(key: state.pageKey, page: const WebPage())),
          ]),
    ], //routes
  );

  static CustomTransitionPage pageTransition({required ValueKey key, required Widget page}) {
    return CustomTransitionPage(
        key: key,
        child: page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
            child: child,
          );
        });
  }
}
