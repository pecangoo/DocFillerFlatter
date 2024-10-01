// Маппер для TemplateField и TemplateFieldModel
import '../data/models/template_model.dart';
import '../domain/entities/template.dart';

TemplateFieldModel mapTemplateFieldToModel(TemplateField field) {
  return TemplateFieldModel(
    id: field.id,
    nameField:  field.nameField,
    tag: field.tag,
    hint: field.hint,
    value: field.value,
  );
}

TemplateField mapTemplateFieldModelToTemplateField(TemplateFieldModel fieldModel) {
  return TemplateField(
    fieldModel.id,
    fieldModel.nameField,
    fieldModel.tag,
    fieldModel.hint,
    value: fieldModel.value,
  );
}


TemplateModel mapTemplateToModel(Template template) {
  return TemplateModel(
    id: template.id,
    uuid: template.uuid,
    nameTemplate: template.nameTemplate,
    timestamp: template.timestamp,
    uuidParentForm:  template.uuidParentForm,
    fields: template.fields.map(mapTemplateFieldToModel).toList(),
  );
}

Template mapTemplateModelToTemplate(TemplateModel templateModel) {
  return Template(
    id: templateModel.id,
    uuid: templateModel.uuid,
    nameTemplate: templateModel.nameTemplate,
    timestamp: templateModel.timestamp,
    uuidParentForm: templateModel.uuidParentForm,
    fields: templateModel.fields.map(mapTemplateFieldModelToTemplateField).toList(),
  );
}