import 'package:filler_doc/app/data/repositories/template_repository.dart';
import 'package:filler_doc/app/domain/entities/template.dart';
import 'package:filler_doc/app/domain/usecases/templates/filler_doc.dart';
import 'package:filler_doc/app/mappers/template_mapper.dart';

class UseCasesTemplates {
  final TemplateRepository _templateRepository;

  UseCasesTemplates({required TemplateRepository templateRepository})
      : _templateRepository = templateRepository;

  Future<int> fillDocument(
      {required String pathDoc,
      required String uuid,
      required String savePath}) async {
    var template = await _getTemplateByUUID(uuid);
    Map<String, String> mapValuesToChange = {};
    for (var e in template.fields) {
      mapValuesToChange[e.tag] = e.value;
    }
    AutoFiller().run(pathDoc, mapValuesToChange, savePath);

    return Future.value(1);
  }

  Future<int> addTemplate(Template template) {
    return _templateRepository.addTemplate(mapTemplateToModel(template));
  }

  Future<int> saveTemplate(Template template) {
   return _templateRepository.saveTemplate(mapTemplateToModel(template));
  }

  updateNameTemplateByUUID(String nameTemplate, String uuid) {
    _templateRepository.updateNameTemplateByUUID(nameTemplate, uuid);
  }

  deleteTemplateByUUID(String uuidTemplate) {
    _templateRepository.deleteTemplateByUUID(uuidTemplate);
  }

  void updateTemplateField(String uuidTemplate, int idField, String value) {
    return _templateRepository.updateTemplateField(
        uuidTemplate, idField, value);
  }

  //
  Future<List<Template>> getAllTemplates() {
    return _templateRepository.getAllTemplates().then(
      (value) {
        print("Mapper $value");
        return value.map(
          (e) {
            return mapTemplateModelToTemplate(e);
          },
        ).toList();
      },
    );
  }

  Future<Template> _getTemplateByUUID(String inUuid) async {
    var templateModel = await _templateRepository.getTemplateByUUID(inUuid);
    return mapTemplateModelToTemplate(templateModel);
  }
}
