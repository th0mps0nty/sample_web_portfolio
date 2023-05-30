import 'package:flutter/material.dart';
import 'package:sample_web/lib/styles/personal_portfolio_colors.dart';

class WelcomePage extends StatelessWidget {
  static const String route = '/welcome';

  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: PersonalPortfolioColors.mainBlue,
      body: Center(child: Text('Welcome Page')),
    );
  }
}
