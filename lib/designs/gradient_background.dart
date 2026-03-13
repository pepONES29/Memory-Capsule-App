import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Color(0xFF6804A6), // Purple
            Color(0xFF160123), // Dark Purple
            Color(0xFF000000), // Black
          ],
          stops: [0.0, 0.62, 0.86],
          center: Alignment.center,
          radius: 1.5,
        ),
      ),
      child: child,
    );
  }
}
