import 'package:flutter/material.dart';

import 'layout_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then(
      (_) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LayoutScreen()),
      ),
    );

    return const Scaffold(
      body: Center(child: Text("Movie App")),
    );
  }
}
