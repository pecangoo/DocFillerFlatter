import 'package:filler_doc/app/data/models/template_model.dart';

abstract class TemplateRepository {

  Future<int> addTemplate(TemplateModel templateModel);
  Future<List<TemplateModel>> getAllTemplates();

  void updateNameTemplateByUUID(String nameTemplate, String uuid);

  void deleteTemplateByUUID(String uuidTemplate);

  void updateTemplateField(String uuidTemplate,
      int idField,
      String value
      );

  Future<int> saveTemplate(TemplateModel templateModel);

  //List<TemplateModel> getAllTemplates();
  Future<TemplateModel> getTemplateByUUID(String inUuid);

}
//
// class TemplateRepositoryTest implements TemplateRepository {
//   List<TemplateModel> listTemplates = [];
//
//   @override
//   void addTemplate(TemplateModel templateModel) {
//     listTemplates.add(templateModel);
//   }
//
//   @override
//   void updateNameTemplateByUUID(String nameTemplate ,String uuidTemplate){
//     var index = listTemplates.indexWhere((element) => element.uuid == uuidTemplate);
//     listTemplates[index].nameTemplate = nameTemplate;
//   }
//
//   @override
//   void deleteTemplateByUUID(String uuid) {
//     listTemplates.removeWhere((element) => element.uuid == uuid);
//   }
//
//   @override
//   void updateTemplateField(String uuidTemplate,
//       int idField, String value
//       ) {
//     var indexTemplate = listTemplates
//         .indexWhere((element) => element.uuid == uuidTemplate);
//     var indexField = listTemplates[indexTemplate]
//         .fields
//         .indexWhere((element) {
//       return element.id == idField;
//     });
//     listTemplates[indexTemplate]
//         .fields[indexField].value = value;
//
//   }
//
//   @override
//   List<TemplateModel> getAllTemplates() {
//     return listTemplates;
//   }
//
//   @override
//   TemplateModel getTemplateByUUID(String inUuid) {
//    return  listTemplates.firstWhere((element) => element.uuid == inUuid);
//   }
//
//   @override
//   void saveTemplate(TemplateModel template) {
//     var index = listTemplates.indexWhere((element) {
//       return  element.uuid == template.uuid ;
//     },);
//     listTemplates[index] = template;
//   }
//
// }
