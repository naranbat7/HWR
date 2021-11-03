import 'package:flutter/material.dart';

class MainAppBar extends PreferredSize {
  MainAppBar(BuildContext context)
      : super(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            elevation: 0,
            iconTheme: IconThemeData(color: Theme.of(context).cardColor),
            backgroundColor: Colors.transparent,
          ),
        );
}
