import 'package:json_annotation/json_annotation.dart';

part 'psycho.g.dart';

@JsonSerializable()
class PsychoModel {
  int? id;
  String? createdDate, imageUrl, description, personalityType;

  PsychoModel({
    this.id,
    this.createdDate,
    this.description,
    this.imageUrl,
    this.personalityType,
  });

  static List<PsychoModel> fromList(List<dynamic> data) => data.map((e) => PsychoModel.fromJson(e)).toList();

  factory PsychoModel.fromJson(Map<String, dynamic> json) => _$PsychoModelFromJson(json);
  Map<String, dynamic> toJson() => _$PsychoModelToJson(this);
}
