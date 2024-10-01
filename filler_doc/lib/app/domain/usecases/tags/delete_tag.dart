
import 'package:filler_doc/app/data/repositories/tag_repository.dart';
import 'package:filler_doc/app/domain/entities/tag.dart';
import 'package:filler_doc/app/mappers/tag_mapper.dart';



class DeleteTag {

  final TagRepository tagRepository;

  DeleteTag(this.tagRepository);

  void call(Tag tag) {
    tagRepository.deleteTag(mapperFromTagToTagModel(tag));
  }


}