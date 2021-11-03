import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainAppBar extends PreferredSize {
  MainAppBar(BuildContext context)
      : super(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            elevation: 0,
            iconTheme: IconThemeData(color: Theme.of(context).cardColor),
            backgroundColor: Colors.transparent,
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
          ),
        );
}
