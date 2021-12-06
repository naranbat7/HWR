// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'psycho.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PsychoModel _$PsychoModelFromJson(Map<String, dynamic> json) {
  return PsychoModel(
    id: json['id'] as int?,
    createdDate: json['createdDate'] as String?,
    description: json['description'] as String?,
    imageUrl: json['imageUrl'] as String?,
    personalityType: json['personalityType'] as String?,
  );
}

Map<String, dynamic> _$PsychoModelToJson(PsychoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'personalityType': instance.personalityType,
    };
