import 'package:flutter/material.dart';
import 'package:hwr_app/enum/local_storage.dart';
import 'package:hwr_app/routes/route_names.dart';
import 'package:hwr_app/services/dialog/index.dart';
import 'package:hwr_app/services/local_storage/index.dart';
import 'package:hwr_app/widgets/appbar/text_appbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hwr_app/widgets/button/main_button.dart';
import 'package:hwr_app/widgets/line/index.dart';

class TutorialPage extends StatelessWidget {
  _onUpload(context) async {
    String tmp = await LocalStorage.getItem(PrefsKey.TIP.value, "");
    if (tmp.isEmpty)
      DialogService.showCameraTip(context);
    else
      Navigator.pushNamed(context, RouteName.CAMERA);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: TextAppBar(context, title: "tutorial".tr()),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: width * 0.15, left: width * 0.15, bottom: 20),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    HeaderLine(hasPadding: false),
                    SizedBox(height: 20),
                    Expanded(
                      child: Image.asset("assets/camera.gif"),
                    ),
                    SizedBox(height: 20),
                    HeaderLine(hasPadding: false),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "help.head".tr(),
                style: TextStyle(
                  color: Theme.of(context).bottomAppBarColor,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "help.body".tr(),
                style: TextStyle(
                  color: Theme.of(context).bottomAppBarColor,
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 40),
              MainButton(
                title: "uploadImage".tr(),
                onPress: () => _onUpload(context),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
