import 'package:flutter/material.dart';
import 'package:hwr_app/widgets/dialog/camera_tip.dart';

class DialogService {
  static showCameraTip(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => CameraTipDialog(),
    );
  }
}
