import 'package:uuid/uuid.dart';

class TemplateField {
  int id;
  final String nameField;
  final String tag;
  final String hint;
  String value = "";

  TemplateField(this.id,
      this.nameField,
      this.tag,
      this.hint,
      {this.value = ""});

  @override
  String toString() {
    return 'TemplateField{id: $id, nameField: $nameField, tag: $tag, hint: $hint, value: $value}';
  }

}

class Template {
  int? id;
  String uuid;
  String nameTemplate;
  String uuidParentForm = "";


  int timestamp;
  List<TemplateField> fields = [];

  Template.newTemplate()
      : uuid = const Uuid().v4(),
        timestamp = DateTime.now().millisecondsSinceEpoch,
        nameTemplate = "",
        uuidParentForm = "";

  Template(
      {
        this.id,
        required this.uuid,
      required this.nameTemplate,
      required this.timestamp,
      required this.fields,
      required this.uuidParentForm});

  @override
  String toString() {
    return 'Template{id: $id, uuid: $uuid, nameTemplate: $nameTemplate, uuidParentForm: $uuidParentForm, timestamp: $timestamp, fields: $fields}';
  }
}
