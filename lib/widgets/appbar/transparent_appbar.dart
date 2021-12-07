import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransparentAppBar extends AppBar {
  TransparentAppBar(BuildContext context)
      : super(
          iconTheme: IconThemeData(color: Theme.of(context).errorColor),
          elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        );
}
