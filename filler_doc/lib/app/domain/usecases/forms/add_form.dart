
import 'package:filler_doc/app/data/repositories/form_repository.dart';
import 'package:filler_doc/app/domain/entities/form.dart';
import 'package:filler_doc/app/mappers/form_mapper.dart';

class AddForm {
  final FormRepository _formRepository;
  AddForm(this._formRepository);

  void call(FormM form) {
    _formRepository.addForm(mapperFromFormToFormModel(form));
  }
}