import 'package:flutter/material.dart';

class CirclesBackground extends StatelessWidget {
  final Widget child;

  const CirclesBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Two circles in the topleft of screen
        Positioned(
          top: -30,
          left: -118,
          child: Container(
            width: 221,
            height: 221,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(112, 194, 225, 252),
            ),
          ),
        ),
        Positioned(
          top: -109,
          left: -54,
          child: Container(
            width: 221,
            height: 221,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(112, 194, 225, 252),
            ),
          ),
        ),

        // Actual page widget goes here
        Scaffold(
          backgroundColor: Colors.transparent,
          body: child,
        )
      ],
    );
  }
}
