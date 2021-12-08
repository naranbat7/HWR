import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hwr_app/model/psycho.dart';

/// Программаас илгээгдэх бүх хүсэлтийг track хийх, зохицуулах [static] класс
class ApiHelper {
  static const BASE_URL = "192.168.55.166:8000";
  static const IMAGE_AI = "/process";

  /// [Authentication] шаардлагатай [POST] method-ийн хүсэлтийг хэрэгжүүлэх метод
  static _postRequest({required String path, data}) async {
    var dio = Dio();
    dio.options
      ..contentType = "application/json"
      ..responseType = ResponseType.json
      ..baseUrl = BASE_URL
      ..connectTimeout = 300000 // 300s
      ..receiveTimeout = 300000 // 300s
      ..sendTimeout = 300000 // 300s
      ..validateStatus = (int? status) {
        return status != null && status > 0;
      };

    dio.options..contentType = "multipart/form-data";
    return await dio.post(path, data: data);
  }

  /// Хэрэглэгч нэг удаагийн OTP авах үеийн хүсэлт
  static Future<PsychoModel> postFile(File file) async {
    // Response res = await _postRequest(
    //   path: IMAGE_AI,
    //   data: await MultipartFile.fromFile(file.path, filename: file.path.split("/").last),
    // );
    // return PsychoModel.fromJson(res.data);
    return PsychoModel.fromJson({
      "id": "09d4d0f6-d74a-4f33-8349-955c112893a4",
      "createdDate": "2021-12-08T15:17:52.944086",
      "imageUrl": "https://i.ibb.co/vDK4nbk/378a65e1dcf6.png",
      "personalityType": "ENFJ"
    });
  }
}
