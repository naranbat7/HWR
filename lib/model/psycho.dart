import 'package:hwr_app/enum/personality_type.dart';
import 'package:hwr_app/model/result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'psycho.g.dart';

@JsonSerializable()
class PsychoModel {
  String? id;
  String createdDate, imageUrl, personalityType;

  PsychoModel({
    this.id,
    required this.createdDate,
    required this.imageUrl,
    required this.personalityType,
  });

  ResultModel get type => PersonalityTypeExtension.enumValue(personalityType).result;

  static List<PsychoModel> fromList(List<dynamic> data) => data.map((e) => PsychoModel.fromJson(e)).toList();

  factory PsychoModel.fromJson(Map<String, dynamic> json) => _$PsychoModelFromJson(json);
  Map<String, dynamic> toJson() => _$PsychoModelToJson(this);
}
