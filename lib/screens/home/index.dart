import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hwr_app/routes/route_names.dart';
import 'package:hwr_app/widgets/appbar/main_appbar.dart';
import 'package:hwr_app/widgets/button/main_button.dart';
import 'package:hwr_app/widgets/drawer/index.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: MainAppBar(context),
        endDrawer: CustomDrawer(context),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              "assets/background.png",
              width: size.width,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Column(
                children: [
                  Expanded(child: SizedBox()),
                  SizedBox(
                    width: size.width * 0.7,
                    child: Column(
                      children: [
                        Text(
                          "main.head".tr(),
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Text(
                          "main.body".tr(),
                          style: Theme.of(context).textTheme.overline,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: MainButton(
                        title: "start".tr(),
                        onPress: () => Navigator.pushNamed(context, RouteName.TUTORIAL),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
