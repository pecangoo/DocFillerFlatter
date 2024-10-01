import 'dart:ffi';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:filler_doc/app/domain/usecases/templates/use_cases_templates.dart';
import 'package:flutter/material.dart';
import '../../../../domain/entities/template.dart';

class TemplateScreenProvider extends ChangeNotifier {
  final UseCasesTemplates useCasesTemplates;
  GlobalKey<FormState> formKey = GlobalKey();
  String currentActiveTemplateUUID = "";
  Template? currentNewTemplate;

  bool editMode = false;
  bool isDraft = false;

  bool buttonBusy = false;

  PlatformFile? _fileDocument;

  PlatformFile? get fileDocument =>
      _fileDocument; // String? get pathToFileDocument => _fileDocument;
  List<Template> listTemplate = [];

  TemplateScreenProvider({required this.useCasesTemplates}) {
    getAndUpdateAllTemplates();
  }

  /// Filler
  void changeFilePath(PlatformFile pathToFileDocument) {
    _fileDocument = pathToFileDocument;
    notifyListeners();
  }

  Future<int> fillDoc(String? documentsPath) async {
    return useCasesTemplates.fillDocument(
        pathDoc: fileDocument!.path!,
        savePath: documentsPath!,
        uuid: currentActiveTemplateUUID);
  }

  bool isFieldOfCurrentTemplateFull() {
    var template = listTemplate.firstWhere(
      (element) {
        return element.uuid == currentActiveTemplateUUID;
      },
    );
    if (template.fields.any(
      (element) {
       return element.value.isEmpty;
      },
    )) {
      return false;
    }
    return true;
  }

  /// UI
  void updateTemplate({String? parentFormUUID, String? nameTemplate}) {
    currentNewTemplate ??= Template.newTemplate();

    if (parentFormUUID != null) {
      currentNewTemplate!.uuidParentForm = parentFormUUID;
    }

    if (nameTemplate != null) {
      currentNewTemplate!.nameTemplate = nameTemplate;
    }
  }

  changeEditMode(bool value) {
    editMode = value;
    notifyListeners();
  }

  changeActiveTile(String uuidTemplate) {
    currentActiveTemplateUUID = uuidTemplate;
    notifyListeners();
  }

  /// Database

  addTemplate() async {
    // Fixme: А мы добавили поля формы в шаблон?
    //currentTemplate.fields;

    // DB
    //Fixme: Вернуть id шаблона
    currentNewTemplate!.id =
        await useCasesTemplates.addTemplate(currentNewTemplate!);
    //updateTemplateList();

    // Local
    listTemplate.add(currentNewTemplate!);

    // Сохранили? Удаляем
    currentNewTemplate = null;
    print("AddTemplate");
    notifyListeners();
  }

  updateNameTemplateByUUID(String newNameTemplate, String uuidTemplate) {
// DB
    useCasesTemplates.updateNameTemplateByUUID(newNameTemplate, uuidTemplate);

// Local
    int index =
        listTemplate.indexWhere((element) => element.uuid == uuidTemplate);
    listTemplate[index].nameTemplate = newNameTemplate;

    // Update
    notifyListeners();
  }

  deleteTemplateByUUID(String uuidTemplate) {
    // DB
    useCasesTemplates.deleteTemplateByUUID(uuidTemplate);

    // Local
    listTemplate.removeWhere((element) => element.uuid == uuidTemplate);

    if (listTemplate.isEmpty) {
      currentActiveTemplateUUID = "";
    }
    notifyListeners();
  }

  localUpdateTemplateFieldValue(int idField, String value) {
    var indexTemplate = listTemplate
        .indexWhere((element) => element.uuid == currentActiveTemplateUUID);
    var indexField = listTemplate[indexTemplate].fields.indexWhere((element) {
      return element.id == idField;
    });
    print("Value IN $value");
    listTemplate[indexTemplate].fields[indexField].value = value;
    print("Value OUT ${listTemplate[indexTemplate].fields[indexField].value}");
    notifyListeners();
  }

  @deprecated
  localUpdateTemplateFieldValue_old(
      String uuidTemplate, int idField, String value) {
    var indexTemplate =
        listTemplate.indexWhere((element) => element.uuid == uuidTemplate);
    var indexField = listTemplate[indexTemplate].fields.indexWhere((element) {
      return element.id == idField;
    });
    listTemplate[indexTemplate].fields[indexField].value = value;

    notifyListeners();
  }

   Future<int> saveAllFieldsToDatabase() {
    // DB[[
    var index = listTemplate.indexWhere(
      (element) {
        return element.uuid == currentActiveTemplateUUID;
      },
    );

    return useCasesTemplates.saveTemplate(listTemplate[index]);
  }

  @deprecated
  databaseAndLocalUpdateTemplateFieldValue_old(
      String uuidTemplate, int idField, String value) {
    // DB
    useCasesTemplates.updateTemplateField(uuidTemplate, idField, value);

    // Local
    localUpdateTemplateFieldValue_old(uuidTemplate, idField, value);

    notifyListeners();
  }

  getAndUpdateAllTemplates() async {
    listTemplate = await useCasesTemplates.getAllTemplates();
    notifyListeners();
  }
}
