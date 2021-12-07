import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hwr_app/screens/loading/index.dart';
import 'package:hwr_app/widgets/appbar/transparent_appbar.dart';
import 'package:hwr_app/widgets/button/main_button.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  _onBack() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => LoadingPage(file: File(""))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppBar(context),
      body: SafeArea(
        child: Center(
          child: MainButton(
            title: "Цааш",
            onPress: _onBack,
          ),
        ),
      ),
    );
  }
}
