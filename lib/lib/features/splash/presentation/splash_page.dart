import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_web/lib/features/splash/widgets/splash_loading.dart';
import 'package:sample_web/lib/features/welcome/presentation/pages/welcome_page.dart';
import 'package:sample_web/lib/helpers/utils.dart';
import 'package:sample_web/lib/styles/personal_portfolio_colors.dart';

class SplashPage extends StatelessWidget {
  static const String route = '/splash';
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () => GoRouter.of(Utils.mainNav.currentContext!).go(WelcomePage.route),
    );

    return const Scaffold(
        backgroundColor: PersonalPortfolioColors.mainBlue,
        body: SplashLoading(
          message: 'Loading an awesome,\nKick-ass Profile...',
        ));
  }
}
