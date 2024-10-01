// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagModel _$TagModelFromJson(Map<String, dynamic> json) => TagModel(
      id: (json['id'] as num?)?.toInt(),
      nameField: json['nameField'] as String,
      tag: json['tag'] as String,
      hint: json['hint'] as String? ?? "",
    );

Map<String, dynamic> _$TagModelToJson(TagModel instance) => <String, dynamic>{
      'id': instance.id,
      'nameField': instance.nameField,
      'tag': instance.tag,
      'hint': instance.hint,
    };
