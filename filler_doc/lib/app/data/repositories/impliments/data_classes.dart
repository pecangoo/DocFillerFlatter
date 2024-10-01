import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:filler_doc/app/data/models/tag_model.dart';
import 'package:filler_doc/app/domain/entities/template.dart';

import '../../models/template_model.dart';

@DataClassName("Templates")
class TemplateTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get uuid => text().unique()();

  TextColumn get nameTemplate => text()();

  IntColumn get timestamp => integer()();

  TextColumn get uuidParentForm => text()();

  TextColumn get jsonFields => text()();

  static String serializeList(List<TemplateFieldModel> list) {
    return jsonEncode(list);
  }

// Метод для десериализации
  static List<TemplateFieldModel> deserializeList(String jsonString) {
    List<dynamic> mapJson = jsonDecode(jsonString);

    return mapJson.map((e) {
      return TemplateFieldModel(
          id: e["id"],
          nameField: e['nameField'],
          tag: e["tag"],
          hint: e["hint"],
          value: e["value"]);
    }).toList();
  }
}

@DataClassName("Tags")
class TagTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get nameField => text()();

  TextColumn get tagField => text()();

  TextColumn get hintField => text()();
}

@DataClassName("Forms")
class FormTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get uuid => text()();

  TextColumn get nameForm => text()();

  IntColumn get timestamp => integer()();

  TextColumn get jsonListTags => text()();

  // Метод для сериализации
  static String serializeList(List<TagModel> list) {
    return jsonEncode(list);
  }

  // Метод для десериализации
  static List<TagModel> deserializeList(String jsonString) {
    //return List<TagModel>.from(
    List<dynamic> mapJson = jsonDecode(jsonString);

    return mapJson.map(
      (e) {
        return TagModel(
            id: e["id"],
            nameField: e['nameField'],
            tag: e['tag'],
            hint: e['hint']);
      },
    ).toList();
  }
}
