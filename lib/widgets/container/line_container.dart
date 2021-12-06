import 'package:flutter/material.dart';

class LineContainerBackground extends StatelessWidget {
  final Widget child;

  const LineContainerBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Image.asset(
          "assets/lines.png",
          width: width * 0.7,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
        child,
      ],
    );
  }
}
