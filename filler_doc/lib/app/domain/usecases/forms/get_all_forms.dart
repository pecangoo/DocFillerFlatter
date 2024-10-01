


import 'package:filler_doc/app/data/repositories/form_repository.dart';
import 'package:filler_doc/app/mappers/form_mapper.dart';

import '../../entities/form.dart';

class GetAllForms {
  final FormRepository _formRepository;
  GetAllForms(this._formRepository);

  Future<List<FormM>> call() {
    return _formRepository
        .getAllForms().then((value) {
         return value.map((e) => mapperFromFormModelToForm(e))
      .toList();
        },);

  }
}