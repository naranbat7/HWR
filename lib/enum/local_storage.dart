import 'package:flutter/foundation.dart';

/// Local Storage key [Shared Preferences] -ийн түлхүүрийг нэгтгэх [enum]
enum PrefsKey {
  /// [HISTORY] -> хамгийн анх удаа татсан
  HISTORY
}

/// [PrefsKey] enum -ийг боловсруулах [extension]
extension PrefsKeyExtension on PrefsKey {
  String get state => describeEnum(this);

  /// [enum]-ийг тэмдэгт мөр болгон илэрхийлэх метод
  String get value {
    switch (this) {
      case PrefsKey.HISTORY:
        return "history";
      default:
        return "";
    }
  }
}
