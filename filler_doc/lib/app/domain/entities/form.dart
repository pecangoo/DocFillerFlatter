import 'package:filler_doc/app/domain/entities/tag.dart';
import 'package:uuid/uuid.dart';

class FormM {
  final int? id;
  final String uuid;
  final String nameForm;
  final int timestamp;
  final List<Tag> tagList;

  FormM(
      {
        this.id,
        String? inUuid,
      required this.nameForm,
      int? inTimestamp,
      required this.tagList})
      : uuid = inUuid ?? const Uuid().v4().toString(),
        timestamp = inTimestamp ?? DateTime.now().millisecondsSinceEpoch;

  @override
  String toString() {
    return 'FormM{uuid: $uuid, nameForm: $nameForm, timestamp: $timestamp, tagList: $tagList}\n\n';
  }
}
