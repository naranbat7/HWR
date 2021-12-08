import 'package:flutter/material.dart';

class LightContainerBackground extends StatelessWidget {
  final Widget child;

  const LightContainerBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset(
          "assets/background-light.png",
          width: size.width,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
        child,
      ],
    );
  }
}
