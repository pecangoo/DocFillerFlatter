

import 'package:filler_doc/app/data/models/tag_model.dart';
import 'package:filler_doc/app/domain/entities/tag.dart';
import 'package:path/path.dart';



abstract class TagRepository {
  Future<int> addTag(TagModel tagModel);
  Future<List<TagModel>> getAllTags();
  deleteTag(TagModel tagModel);
}

