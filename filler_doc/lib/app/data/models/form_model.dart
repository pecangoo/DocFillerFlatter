
import 'package:filler_doc/app/data/models/tag_model.dart';

class FormModel {
    final int? id;
    final String uuid;
    final String nameForm;
    int timestamp;
    final List<TagModel> tagList;

   FormModel({this.id, required this.uuid, required this.nameForm,
     required this.timestamp, required this.tagList});

}