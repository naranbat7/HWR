import 'package:flutter/material.dart';

class TransparentAppBar extends StatelessWidget {
  final Widget child;

  const TransparentAppBar({required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Padding(
          padding: EdgeInsets.only(left: 5, top: 10),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).errorColor,
            ),
          ),
        ),
      ],
    );
  }
}
