import 'package:flutter/material.dart';

class MainContainerBackground extends StatelessWidget {
  final Widget child;

  const MainContainerBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          "assets/background.png",
          width: size.width,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
        child,
      ],
    );
  }
}
