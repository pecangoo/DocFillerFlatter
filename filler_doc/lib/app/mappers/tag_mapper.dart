
import 'package:filler_doc/app/data/models/tag_model.dart';
import 'package:filler_doc/app/domain/entities/tag.dart';

TagModel mapperFromTagToTagModel(Tag tag) {
  return TagModel(
      id:  tag.id,
      nameField: tag.nameField,
      tag: tag.tag,
      hint: tag.hint

  );
}


// Mapper from TagModel to Tag
Tag mapperFromTagModelToTag(TagModel tagModel) {
  return Tag(
    id: tagModel.id,
    nameField: tagModel.nameField,
    tag: tagModel.tag,
    hint: tagModel.hint,
  );
}
