import 'dart:math';

import 'package:flutter/material.dart';

Widget buildDots(int index, animationController) {
  return AnimatedBuilder(
    animation: animationController,
    builder: (context, child) {
      return Container(
        width: 8,
        height: 8,
        margin: EdgeInsets.symmetric(horizontal: 2), // Added margin for spacing
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(
            0.3 + (sin(animationController.value * 2 * pi + index * 0.5) * 0.3),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      );
    },
  );
}
