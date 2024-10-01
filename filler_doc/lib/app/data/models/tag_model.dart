

import 'package:json_annotation/json_annotation.dart';


part 'tag_model.g.dart';

@JsonSerializable()
class TagModel {
  final int? id;
  final String nameField;
  final String tag;
  final String hint;
  TagModel({this.id,
    required this.nameField,
    required this.tag,
    this.hint = ""} );


  @override
  String toString() {
    return 'TagModel{id: $id, nameField: $nameField, tag: $tag, hint: $hint}';
  }

  // Фабричный метод для создания объекта из JSON
  factory TagModel.fromJson(Map<String, dynamic> json) => _$TagModelFromJson(json);

  // Метод для преобразования объекта в JSON
  Map<String, dynamic> toJson() => _$TagModelToJson(this);

}