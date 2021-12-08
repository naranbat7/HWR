import 'package:flutter/foundation.dart';
import 'package:hwr_app/model/result.dart';

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

  ResultModel get result {
    switch (this) {
      case PersonalityType.ENFJ:
        return ResultModel(
            title: "Protagonist",
            category: "Diplomats",
            url: this.label,
            mind: 61,
            energy: 55,
            nature: 46,
            tactics: 58,
            identity: 40);
      case PersonalityType.INFJ:
        return ResultModel(
            title: "Advocate",
            category: "Diplomats",
            url: this.label,
            mind: 24,
            energy: 51,
            nature: 47,
            tactics: 63,
            identity: 31);
      case PersonalityType.ESFJ:
        return ResultModel(
            title: "Consul",
            category: "Sentinels",
            url: this.label,
            mind: 52,
            energy: 46,
            nature: 44,
            tactics: 57,
            identity: 56);
      case PersonalityType.ISFJ:
        return ResultModel(
            title: "Defender",
            category: "Sentinels",
            url: this.label,
            mind: 41,
            energy: 51,
            nature: 43,
            tactics: 40,
            identity: 68);

      case PersonalityType.ENFP:
        return ResultModel(
            title: "Campaigner",
            category: "Diplomats",
            url: this.label,
            mind: 64,
            energy: 59,
            nature: 27,
            tactics: 37,
            identity: 69);
      case PersonalityType.INFP:
        return ResultModel(
            title: "Mediator",
            category: "Diplomats",
            url: this.label,
            mind: 41,
            energy: 51,
            nature: 43,
            tactics: 40,
            identity: 68);
      case PersonalityType.ESFP:
        return ResultModel(
            title: "Entertainer",
            category: "Explorers",
            url: this.label,
            mind: 54,
            energy: 61,
            nature: 54,
            tactics: 53,
            identity: 36);
      case PersonalityType.ISFP:
        return ResultModel(
            title: "Adventurer",
            category: "Explorers",
            url: this.label,
            mind: 22,
            energy: 37,
            nature: 41,
            tactics: 49,
            identity: 49);

      case PersonalityType.ENTP:
        return ResultModel(
            title: "Architect",
            category: "Analysts",
            url: this.label,
            mind: 24,
            energy: 51,
            nature: 47,
            tactics: 63,
            identity: 31);
      case PersonalityType.INTP:
        return ResultModel(
            title: "Logician",
            category: "Analysts",
            url: this.label,
            mind: 24,
            energy: 51,
            nature: 47,
            tactics: 63,
            identity: 31);
      case PersonalityType.ESTP:
        return ResultModel(
            title: "Entrepreneur",
            category: "Explorers",
            url: this.label,
            mind: 54,
            energy: 61,
            nature: 54,
            tactics: 53,
            identity: 36);
      case PersonalityType.ISTP:
        return ResultModel(
            title: "Virtuoso",
            category: "Explorers",
            url: this.label,
            mind: 36,
            energy: 34,
            nature: 54,
            tactics: 42,
            identity: 49);

      case PersonalityType.ENTJ:
        return ResultModel(
            title: "Commander",
            category: "Analysts",
            url: this.label,
            mind: 54,
            energy: 61,
            nature: 54,
            tactics: 53,
            identity: 36);
      case PersonalityType.INTJ:
        return ResultModel(
            title: "Debater",
            category: "Analysts",
            url: this.label,
            mind: 24,
            energy: 51,
            nature: 47,
            tactics: 63,
            identity: 31);
      case PersonalityType.ESTJ:
        return ResultModel(
            title: "Executive",
            category: "Sentinels",
            url: this.label,
            mind: 41,
            energy: 51,
            nature: 43,
            tactics: 40,
            identity: 68);
      case PersonalityType.ISTJ:
        return ResultModel(
            title: "Logistician",
            category: "Sentinels",
            url: this.label,
            mind: 49,
            energy: 45,
            nature: 52,
            tactics: 60,
            identity: 47);
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
