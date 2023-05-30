import 'package:flutter/material.dart';

class WebPage extends StatelessWidget {
  static const String route = "/web";
  const WebPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Web Page!'),
    );
  }
}
