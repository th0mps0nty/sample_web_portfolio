import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_web/lib/features/welcome/presentation/pages/welcome_page.dart';
import 'package:sample_web/lib/styles/personal_portfolio_colors.dart';

final pageColorProvider = StateProvider((ref) => PersonalPortfolioColors.pageColor[WelcomePage.route]!);
