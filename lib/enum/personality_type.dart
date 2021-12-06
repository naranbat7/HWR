import 'package:flutter/foundation.dart';

enum PersonalityType {
  ENFJ,
  INFJ,
  ESFJ,
  ISFJ,

  ENFP,
  INFP,
  ESFP,
  ISFP,

  ENTP,
  INTP,
  ESTP,
  ISTP,

  ENTJ,
  INTJ,
  ESTJ,
  ISTJ,
}

/// [PersonalityType] enum -ийг боловсруулах [extension]
extension PersonalityTypeExtension on PersonalityType {
  String get personalityType => describeEnum(this);

  /// [enum]-ийг тэмдэгт мөр болгон илэрхийлэх метод
  String get label {
    switch (this) {
      case PersonalityType.ENFJ:
        return "ENFJ";
      case PersonalityType.INFJ:
        return "INFJ";
      case PersonalityType.ESFJ:
        return "ESFJ";
      case PersonalityType.ISFJ:
        return "ISFJ";

      case PersonalityType.ENFP:
        return "ENFP";
      case PersonalityType.INFP:
        return "INFP";
      case PersonalityType.ESFP:
        return "ESFP";
      case PersonalityType.ISFP:
        return "ISFP";

      case PersonalityType.ENTP:
        return "ENTP";
      case PersonalityType.INTP:
        return "INTP";
      case PersonalityType.ESTP:
        return "ESTP";
      case PersonalityType.ISTP:
        return "ISTP";

      case PersonalityType.ENTJ:
        return "ENTJ";
      case PersonalityType.INTJ:
        return "INTJ";
      case PersonalityType.ESTJ:
        return "ESTJ";
      case PersonalityType.ISTJ:
        return "ISTJ";
    }
  }

  static PersonalityType enumValue(String value) {
    switch (value) {
      case "ENFJ":
        return PersonalityType.ENFJ;
      case "INFJ":
        return PersonalityType.INFJ;
      case "ESFJ":
        return PersonalityType.ESFJ;
      case "ISFJ":
        return PersonalityType.ISFJ;

      case "ENFP":
        return PersonalityType.ENFP;
      case "INFP":
        return PersonalityType.INFP;
      case "ESFP":
        return PersonalityType.ESFP;
      case "ISFP":
        return PersonalityType.ISFP;

      case "ENTP":
        return PersonalityType.ENTP;
      case "INTP":
        return PersonalityType.INTP;
      case "ESTP":
        return PersonalityType.ESTP;
      case "ISTP":
        return PersonalityType.ISTP;

      case "ENTJ":
        return PersonalityType.ENTJ;
      case "INTJ":
        return PersonalityType.INTJ;
      case "ESTJ":
        return PersonalityType.ESTJ;
      case "ISTJ":
        return PersonalityType.ISTJ;
      default:
        return PersonalityType.ENFJ;
    }
  }
}
