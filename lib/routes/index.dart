import 'package:flutter/cupertino.dart';
import 'package:hwr_app/routes/route_names.dart';
import 'package:hwr_app/screens/camera/index.dart';
import 'package:hwr_app/screens/error/index.dart';
import 'package:hwr_app/screens/history/index.dart';
import 'package:hwr_app/screens/home/index.dart';
import 'package:hwr_app/screens/tutorial/index.dart';

var routes = <String, WidgetBuilder>{
  RouteName.HOME: (_) => HomePage(),
  RouteName.HISTORY: (_) => HistoryPage(),
  RouteName.TUTORIAL: (_) => TutorialPage(),
  RouteName.CAMERA: (_) => CameraPage(),
  RouteName.ERROR: (_) => ErrorPage(),
};
