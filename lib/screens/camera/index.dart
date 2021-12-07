import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TransparentAppBar(
          child: controller != null
              ? CameraPreview(controller!)
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
