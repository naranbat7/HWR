import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hwr_app/routes/route_names.dart';

class CustomDrawer extends SizedBox {
  CustomDrawer(BuildContext context)
      : super(
          width: 160,
          child: Drawer(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              color: Theme.of(context).dialogBackgroundColor,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: ClipOval(
                        child: Container(
                          width: 35,
                          height: 35,
                          color: Theme.of(context).chipTheme.backgroundColor,
                          child: Icon(
                            Icons.close,
                            color: Theme.of(context).dialogBackgroundColor,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          SizedBox(height: 15),
                          _tileBuilder(
                            context,
                            title: "home".tr(),
                            icon: Icon(Icons.home_outlined, size: 22),
                            onPress: () => Navigator.pop(context),
                            isActive: true,
                          ),
                          _tileBuilder(
                            context,
                            title: "history".tr(),
                            icon: Icon(Icons.book_outlined, size: 20),
                            onPress: () => Navigator.pushNamed(context, RouteName.HISTORY),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

  static _tileBuilder(
    context, {
    required String title,
    required Icon icon,
    required VoidCallback onPress,
    bool isActive = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).chipTheme.backgroundColor : null,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 14, fontFamily: "Pacifico"),
        ),
        leading: icon,
        onTap: onPress,
        horizontalTitleGap: 0,
        dense: true,
      ),
    );
  }
}
