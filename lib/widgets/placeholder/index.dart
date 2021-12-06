import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class MainPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "empty".tr(),
        style: TextStyle(
          fontSize: 20,
          fontFamily: "Pacifico",
          color: Theme.of(context).cardColor,
        ),
      ),
    );
  }
}
