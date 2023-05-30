import 'package:flutter/material.dart';
import 'package:sample_web/lib/routes/app_routes.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Portfolio App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Product Sans',
        ),
      routeInformationProvider: AppRoutes.router.routeInformationProvider,
      routeInformationParser: AppRoutes.router.routeInformationParser,
      routerDelegate: AppRoutes.router.routerDelegate,
    );
  }
}
