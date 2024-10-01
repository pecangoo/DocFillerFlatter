// Mapper from FormModel to Form
import 'package:filler_doc/app/domain/entities/form.dart';
import 'package:filler_doc/app/mappers/tag_mapper.dart';

import '../data/models/form_model.dart';

FormM mapperFromFormModelToForm(FormModel formModel) {
  return FormM(
    id: formModel.id,
    inUuid: formModel.uuid,
    nameForm: formModel.nameForm,
    inTimestamp: formModel.timestamp,
    tagList: formModel.tagList.map(mapperFromTagModelToTag).toList(),
  );
}

// Mapper from Form to FormModel
FormModel mapperFromFormToFormModel(FormM form) {
  return FormModel(
    id: form.id,
    uuid: form.uuid,
    nameForm: form.nameForm,
    timestamp: form.timestamp,
    tagList: form.tagList.map(mapperFromTagToTagModel).toList(),
  );
}
