import 'package:flutter/material.dart';
import 'package:sample_web/lib/features/navigation/presentation/widgets/left_navigation.dart';
import 'package:sample_web/lib/helpers/utils.dart';
import 'package:sample_web/lib/styles/personal_portfolio_colors.dart';

class PortfolioMainPage extends StatelessWidget {
  static const String route = '/main';
  final Widget child;

  const PortfolioMainPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Utils.mainScaffold,
        backgroundColor: PersonalPortfolioColors.mainBlue,
        body: Stack(
          children: [
            Center(
              child: child,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: LeftNavigation(),
            ),
          ],
        ));
  }
}
