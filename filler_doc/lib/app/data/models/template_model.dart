

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'template_model.g.dart';

@JsonSerializable()
class TemplateFieldModel {
  final int id;
  final String nameField;
  final String tag;
  final String hint;
  String value;

  TemplateFieldModel({required this.id,
    required this.nameField,
    required this.tag, required this.hint, this.value = ""});


  // Фабричный метод для создания объекта из JSON
  factory TemplateFieldModel.fromJson(Map<String, dynamic> json) => _$TemplateFieldModelFromJson(json);

  // Метод для преобразования объекта в JSON
  Map<String, dynamic> toJson() => _$TemplateFieldModelToJson(this);

  @override
  String toString() {
    return 'TemplateFieldModel{id: $id,'
        ' nameField: $nameField,'
        ' tag: $tag,'
        ' hint: $hint,'
        ' value: $value}';
  }
}

class TemplateModel {
    int? id;
   String uuid;
   String nameTemplate;
   int timestamp;
   String uuidParentForm;
  List<TemplateFieldModel> fields = [];

  TemplateModel({
    this.id,
    required this.uuid,
    required this.uuidParentForm,
    required this.nameTemplate,
    required this.timestamp,
    required this.fields});

    @override
  String toString() {
    return 'TemplateModel{id: $id, uuid: $uuid, nameTemplate: $nameTemplate, timestamp: $timestamp, uuidParentForm: $uuidParentForm, fields: $fields}';
  }
}