import 'package:json_annotation/json_annotation.dart';

part 'psycho.g.dart';

@JsonSerializable()
class PsychoModel {
  int? id;
  String? createdDate, imageUrl, personalityType;

  PsychoModel({
    this.id,
    this.createdDate,
    this.imageUrl,
    this.personalityType,
  });

  static List<PsychoModel> fromList(List<dynamic> data) => data.map((e) => PsychoModel.fromJson(e)).toList();

  factory PsychoModel.fromJson(Map<String, dynamic> json) => _$PsychoModelFromJson(json);
  Map<String, dynamic> toJson() => _$PsychoModelToJson(this);
}
