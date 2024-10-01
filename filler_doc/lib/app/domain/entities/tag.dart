import 'dart:async';

import 'package:uuid/uuid.dart';

class Tag {

  int? id;
  String nameField = "";
  String tag = "";
  String hint = "";
  bool isActive = false;
  bool isSearch = false;

  Tag({this.id, required this.nameField, required this.tag, this.hint = "", this.isActive = false});
  Tag.empty();


  @override
  String toString() {
    return 'Tag{id: $id, nameField: $nameField, tag: $tag, hint: $hint, isActive: $isActive, isSearch: $isSearch}';
  }
}