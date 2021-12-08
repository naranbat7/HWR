import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hwr_app/routes/route_names.dart';
import 'package:hwr_app/screens/loading/index.dart';
import 'package:hwr_app/services/tensorflow/index.dart';
import 'package:hwr_app/widgets/appbar/transparent_appbar.dart';
import 'package:hwr_app/widgets/button/main_button.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final ts = TensorflowService();
  List<CameraDescription> cameras = [];
  CameraController? controller;

  @override
  void initState() {
    super.initState();
    _getCamera();
  }

  _getCamera() async {
    cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  _onBack() {
    openAppSettings();
  }

  _onPress() async {
    if (controller != null) {
      XFile file = await controller!.takePicture();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => LoadingPage(file: File(file.path))),
        ModalRoute.withName(RouteName.HOME),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TransparentAppBar(
          child: controller != null
              ? Stack(
                  children: [
                    CameraPreview(controller!),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 40),
                        child: IconButton(
                          onPressed: _onPress,
                          icon: Icon(Icons.camera, size: 50),
                        ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Та камерны эрх идэвхжүүлээгүй байна."),
                      MainButton(
                        title: "Тохиргоо нээх",
                        onPress: _onBack,
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
