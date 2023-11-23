import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    super.key,
    required this.child,

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ColorBlurEffect(
                alignment: Alignment.centerRight,
              ),
              ColorBlurEffect(
                alignment: Alignment.centerLeft,
              ),
              ColorBlurEffect(
                alignment: Alignment.centerRight,
              ),
            ],
          ),
          Align(
            child: child,
          ),
        ],
      ),
    );
  }
}

class ColorBlurEffect extends StatelessWidget {
  final Color color;
  final Alignment alignment;
  const ColorBlurEffect({
    this.color = Colors.cyan,
    this.alignment = Alignment.center,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: alignment,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
        ),
        Align(
          alignment: alignment,
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(
              sigmaX: 100,
              sigmaY: 100,
            ),
            child: Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
              ),
            ),
          ),
        )
      ],
    );
  }
}
