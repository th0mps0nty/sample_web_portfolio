import 'package:flutter/material.dart';
import 'package:sample_web/lib/features/splash/widgets/splash_loading.dart';
import 'package:sample_web/lib/styles/personal_portfolio_colors.dart';

class SplashPage extends StatelessWidget {
  static const String route = '/splash';
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: PersonalPortfolioColors.mainBlue,
        body: SplashLoading(
          message: 'Loading an awesome,\nKick-ass Profile...',
        ));
  }
}
