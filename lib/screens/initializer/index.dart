import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hwr_app/routes/route_names.dart';

class InitializerPage extends StatefulWidget {
  @override
  _InitializerPageState createState() => _InitializerPageState();
}

class _InitializerPageState extends State<InitializerPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Timer(Duration(milliseconds: 300), () => Navigator.pushNamed(context, RouteName.HOME));
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            "assets/logo.png",
            width: width * 0.35,
          ),
        ),
      ),
    );
  }
}
