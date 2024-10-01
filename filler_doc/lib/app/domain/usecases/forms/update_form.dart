import 'package:filler_doc/app/data/repositories/form_repository.dart';
import 'package:filler_doc/app/domain/entities/form.dart';
import 'package:filler_doc/app/mappers/form_mapper.dart';

class UpdateForm {

  final FormRepository _repository;

  UpdateForm (this._repository);

  Future<int> call(FormM newForm) {
    return _repository.updateForm(mapperFromFormToFormModel(newForm));
   // return mapperFromFormModelToForm(formModel);
  }
}