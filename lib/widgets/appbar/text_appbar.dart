import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextAppBar extends PreferredSize {
  TextAppBar(BuildContext context, {String title = ""})
      : super(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            title: Text(
              title,
              style: Theme.of(context).textTheme.overline?.copyWith(color: Theme.of(context).errorColor, fontSize: 26),
            ),
            iconTheme: IconThemeData(color: Theme.of(context).errorColor),
            elevation: 0,
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
        );
}
