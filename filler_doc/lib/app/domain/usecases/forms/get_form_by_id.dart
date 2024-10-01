

import 'package:filler_doc/app/domain/entities/form.dart';
import 'package:filler_doc/app/mappers/form_mapper.dart';

import '../../../data/repositories/form_repository.dart';

class GetFormByUUID {
  final FormRepository _repository;

  GetFormByUUID (this._repository);

  FormM call(String uuid) {
    return mapperFromFormModelToForm(_repository.getFormByUUID(uuid));
  }
}