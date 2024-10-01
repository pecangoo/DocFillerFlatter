

import 'package:filler_doc/app/data/models/tag_model.dart';
import 'package:filler_doc/app/data/repositories/tag_repository.dart';
import 'package:filler_doc/app/mappers/tag_mapper.dart';

import '../../entities/tag.dart';



class AddTag {
  final TagRepository tagRepository;

  AddTag(this.tagRepository);
  
  Future<int> call(Tag tag){
    return tagRepository.addTag(
       mapperFromTagToTagModel(tag)
    );
  }
}