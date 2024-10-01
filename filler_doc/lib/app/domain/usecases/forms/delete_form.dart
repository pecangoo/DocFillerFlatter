import 'package:filler_doc/app/data/repositories/form_repository.dart';

class DeleteForm {
  final FormRepository _formRepository;
  DeleteForm(this._formRepository);

  void call(String uuid) {

    _formRepository.deleteFormByUUID(uuid);
  }
}