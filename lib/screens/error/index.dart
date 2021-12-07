import 'package:flutter/material.dart';
import 'package:hwr_app/routes/route_names.dart';
import 'package:hwr_app/widgets/button/main_button.dart';
import 'package:easy_localization/easy_localization.dart';

class ErrorPage extends StatelessWidget {
  _onRetry(context) {
    Navigator.popUntil(context, ModalRoute.withName(RouteName.HOME));
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset("assets/error.gif", height: 150, width: 150),
                  Text(
                    "error.title".tr(),
                    style: TextStyle(
                      fontSize: 36,
                      color: Theme.of(context).errorColor,
                      fontFamily: "Pacifico",
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "error.body".tr(),
                    style: TextStyle(
                      color: Theme.of(context).bottomAppBarColor,
                      fontFamily: "Pacifico",
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              MainButton(
                title: "retry".tr(),
                onPress: () => _onRetry(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
