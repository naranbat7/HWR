import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeaderLine extends StatelessWidget {
  final bool hasPadding;

  const HeaderLine({this.hasPadding = true});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: hasPadding ? EdgeInsets.only(left: width * 0.15, right: width * 0.15) : EdgeInsets.zero,
      child: Container(height: 1, color: Theme.of(context).errorColor),
    );
  }
}
