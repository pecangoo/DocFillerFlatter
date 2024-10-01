import 'dart:io';
import 'dart:ui';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:filler_doc/app/data/models/form_model.dart';
import 'package:filler_doc/app/data/models/tag_model.dart';
import 'package:filler_doc/app/data/models/template_model.dart';
import 'package:filler_doc/app/data/repositories/form_repository.dart';
import 'package:filler_doc/app/data/repositories/impliments/data_classes.dart';
import 'package:filler_doc/app/data/repositories/template_repository.dart';
import "package:filler_doc/utils/apputils.dart" as apputils;
import '../tag_repository.dart';

part 'drift_data_base.g.dart';

@DriftDatabase(tables: [TagTable, FormTable, TemplateTable])
class DriftRepositoryDriftImpl extends _$DriftRepositoryDriftImpl
    implements TagRepository, FormRepository, TemplateRepository {
  DriftRepositoryDriftImpl()
      : super(NativeDatabase(File(apputils.tagDataBase!)));

  TagTableCompanion _fromTagModelToTagTableCompanion(TagModel tagModel) {

    return TagTableCompanion(
        id: tagModel.id == null ? const Value.absent() : Value(tagModel.id!),
        nameField: Value(tagModel.nameField),
        tagField: Value(tagModel.tag),
        hintField: Value(tagModel.hint));
  }

  FormTableCompanion _fromFormModelToFormModelCompanion(FormModel formModel) {
    return FormTableCompanion(
        id: formModel.id == null ? const Value.absent() : Value(formModel.id!),
        nameForm: Value(formModel.nameForm),
        timestamp: Value(formModel.timestamp),
        uuid: Value(formModel.uuid),
        jsonListTags: Value(FormTable.serializeList(formModel.tagList)));
  }

  TemplateTableCompanion _fromTemplateModelToTemplateTableCompanion(
      TemplateModel templateModel) {
    return TemplateTableCompanion(
        id: templateModel.id == null
            ? const Value.absent()
            : Value(templateModel.id!),
        nameTemplate: Value(templateModel.nameTemplate),
        uuid: Value(templateModel.uuid),
        uuidParentForm: Value(templateModel.uuidParentForm),
        timestamp: Value(templateModel.timestamp),
        jsonFields: Value(TemplateTable.serializeList(templateModel.fields)));
  }

  @override
  int get schemaVersion => 1;

  /// TAGS_______

  @override
  Future<int> addTag(TagModel tagModel) {
    return into(tagTable).insert(_fromTagModelToTagTableCompanion(tagModel));
  }

  @override
  deleteTag(TagModel tagModel) {
    // TODO: По факту удаление тэга это изменение его маркера.

    delete(tagTable).delete(_fromTagModelToTagTableCompanion(tagModel));
  }

  @override
  Future<List<TagModel>> getAllTags() {
    var list = select(tagTable).get();
    return list.then(
      (value) {
        var finalList = value.map(
          (element) {
            return TagModel(
                id: element.id,
                nameField: element.nameField,
                tag: element.tagField,
                hint: element.hintField);
          },
        ).toList();
        //   print(finalList);
        return finalList;
      },
    );
  }

  /// FORMS_____

  @override
  void addForm(FormModel formModel) {
    into(formTable)
        .insertOnConflictUpdate(_fromFormModelToFormModelCompanion(formModel));
  }

  @override
  Future<void> deleteFormByUUID(String uuid) async {
    await (delete(formTable)..where((tbl) => tbl.uuid.equals(uuid))).go();
  }

  @override
  Future<List<FormModel>> getAllForms() {
    // TODO: implement getAllForms
    return select(formTable).get().then(
      (value) {
        return value.map((e) {
          return FormModel(
              id: e.id,
              nameForm: e.nameForm,
              timestamp: e.timestamp,
              uuid: e.uuid,
              tagList: FormTable.deserializeList(e.jsonListTags));
        }).toList();
      },
    );
    throw UnimplementedError();
  }

  @override
  FormModel getFormByUUID(String uuid) {
    throw UnimplementedError();
  }

  @override
  Future<int> updateForm(FormModel formModel) {
    return into(formTable)
        .insertOnConflictUpdate(_fromFormModelToFormModelCompanion(formModel));
  }

  /// Templates_____
  @override
  Future<int> addTemplate(TemplateModel templateModel) {
    return into(templateTable)
        .insert(_fromTemplateModelToTemplateTableCompanion(templateModel));
  }

  @override
  deleteTemplateByUUID(String uuidTemplate) async {
    await (delete(templateTable)..where((tbl) => tbl.uuid.equals(uuidTemplate)))
        .go();
  }

  @override
  Future<List<TemplateModel>> getAllTemplates() {
    return select(templateTable).get().then(
      (value) {
        return value.map(
          (e) {
            print("GEt ALL  $e");
            return TemplateModel(
                id: e.id,
                uuid: e.uuid,
                timestamp: e.timestamp,
                uuidParentForm: e.uuidParentForm,
                nameTemplate: e.nameTemplate,
                fields: TemplateTable.deserializeList(e.jsonFields));
          },
        ).toList();
      },
    );
  }

  @override
  Future<TemplateModel> getTemplateByUUID(String inUuid) async {
    var res = await (select(templateTable)
          ..where(
            (tbl) {
              return tbl.uuid.equals(inUuid);
            },
          ))
        .getSingle();
    return TemplateModel(
      id: res.id,
        uuid: res.uuid,
        uuidParentForm: res.uuidParentForm,
        nameTemplate: res.nameTemplate,
        timestamp: res.timestamp,
        fields: TemplateTable.deserializeList(res.jsonFields));
  }

  @override
  Future<int> saveTemplate(TemplateModel templateModel) {
    //print(_fromTemplateModelToTemplateTableCompanion(templateModel));
   return into(templateTable)
        .insert(
      _fromTemplateModelToTemplateTableCompanion(templateModel),

      mode: InsertMode.insertOrReplace

    );

  }

  @override
  void updateNameTemplateByUUID(String nameTemplate, String uuid) {
    // TODO: implement updateNameTemplateByUUID
    // TODO: not using else
  }

  @override
  void updateTemplateField(String uuidTemplate, int idField, String value) {
    // TODO: implement updateTemplateField
  }
}
