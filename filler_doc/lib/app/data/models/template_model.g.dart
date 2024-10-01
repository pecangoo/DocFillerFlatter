// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemplateFieldModel _$TemplateFieldModelFromJson(Map<String, dynamic> json) =>
    TemplateFieldModel(
      id: (json['id'] as num).toInt(),
      nameField: json['nameField'] as String,
      tag: json['tag'] as String,
      hint: json['hint'] as String,
      value: json['value'] as String? ?? "",
    );

Map<String, dynamic> _$TemplateFieldModelToJson(TemplateFieldModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameField': instance.nameField,
      'tag': instance.tag,
      'hint': instance.hint,
      'value': instance.value,
    };
