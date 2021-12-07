import 'package:easy_localization/easy_localization.dart';

class CustomUtils {
  static String str2datetime(String value) {
    DateTime tmp;
    try {
      tmp = DateFormat("yyyy-MM-ddTHH:mm:ss").parse(value);
    } catch (ex) {
      tmp = DateTime.now();
    }
    return "${tmp.year}-${withZeroDate(tmp.month)}-${withZeroDate(tmp.day)} ${withZeroDate(tmp.hour)}:${withZeroDate(tmp.minute)}";
  }

  static String withZeroDate(int value) {
    return value < 10 ? "0$value" : value.toString();
  }
}
