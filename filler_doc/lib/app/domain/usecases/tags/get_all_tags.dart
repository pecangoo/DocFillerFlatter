import 'package:filler_doc/app/data/repositories/tag_repository.dart';
import 'package:filler_doc/app/domain/entities/tag.dart';
import 'package:filler_doc/app/mappers/tag_mapper.dart';

class GetAllTags {
  final TagRepository tagRepository;

  GetAllTags(this.tagRepository);

  Future<List<Tag>> call() {
    return tagRepository.getAllTags().then(
      (value) {
        return value.map(
          (element) {
            return mapperFromTagModelToTag(element);
          },
        ).toList();
      },
    );
  }
}
