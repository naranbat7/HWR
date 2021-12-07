import 'package:tflite_flutter/tflite_flutter.dart';

class TensorflowService {
  static Interpreter? interpreter;

  TensorflowService() {
    _initInterpreter();
  }

  _initInterpreter() async {
    interpreter = await Interpreter.fromAsset("assets/ocr.tflite");
  }

  close() {
    interpreter?.close();
  }
}
