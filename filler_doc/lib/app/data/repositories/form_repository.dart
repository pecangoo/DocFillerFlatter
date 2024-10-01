import 'package:filler_doc/app/data/models/tag_model.dart';
import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import '../models/form_model.dart';

abstract class FormRepository {
  void addForm(FormModel form);

  // List<FormModel> getAllForms();

 FormModel getFormByUUID(String uuid);
  Future<List<FormModel>> getAllForms();

  void deleteFormByUUID(String uuid);

  Future<int> updateForm(FormModel formModel);
}
//
// class FormRepositoryTest implements FormRepository {
//   List<FormModel> listFormModel = [
//     FormModel(
//         uuid: Uuid().v4().toString(),
//         nameForm: "Имя формы один",
//         timestamp: DateTime.now().millisecondsSinceEpoch,
//         tagList: []),
//     FormModel(
//         uuid: Uuid().v4().toString(),
//         nameForm: "Имя формы два",
//         timestamp: DateTime.now().millisecondsSinceEpoch,
//         tagList: []),
//     FormModel(
//         uuid: Uuid().v4().toString(),
//         nameForm: "Имя формы три",
//         timestamp: DateTime.now().millisecondsSinceEpoch,
//         tagList: [
//           TagModel(id: 1, nameField: "Имя поля", tag: "tag_поля"),
//           TagModel(id: 2, nameField: "Имя второго поля", tag: "tag_поля"),
//           TagModel(id: 3, nameField: "Имя второго поля", tag: "tag_поля"),
//         ]),
//   ];
//
//   @override
//   void addForm(FormModel form) {
//     listFormModel.add(form);
//   }
//
//   @override
//   void deleteFormByUUID(String uuid) {
//     listFormModel.removeWhere((form) => form.uuid == uuid);
//   }
//
//   @override
//   List<FormModel> getAllForms() {
//     return listFormModel;
//   }
//
//   @override
//   FormModel getFormByUUID(String uuid) {
//     try {
//       return listFormModel.firstWhere((form) => form.uuid == uuid);
//     } catch (e) {
//       throw Exception("Form with UUID $uuid not found");
//     }
//   }
//
//   @override
//   FormModel updateForm(FormModel newForm) {
//     int index = listFormModel.indexWhere((form) => form.uuid == newForm.uuid);
//     if (index != -1) {
//       listFormModel[index] = newForm;
//       return newForm;
//     } else {
//       throw Exception("Form with UUID ${newForm.uuid} not found for update");
//     }
//   }
// }
//
// class FormRepositoryDB implements FormRepository {
//   Database? _database;
//
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDB();
//     return _database!;
//   }
//
//   Future<Database> _initDB() async {
//     String path = join(await getDatabasesPath(), 'tags.db');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute('''
//           CREATE TABLE tags(
//             id TEXT PRIMARY KEY,
//             nameForm TEXT,
//             timestamp INTEGER,
//             hint TEXT
//           )
//         ''');
//       },
//     );
//   }
//
//
//   @override
//   void addForm(FormModel form) {
//     // TODO: implement addForm
//   }
//
//   @override
//   void deleteFormByUUID(String uuid) {
//     // TODO: implement deleteFormByUUID
//   }
//
//   @override
//   List<FormModel> getAllForms() {
//     // TODO: implement getAllForms
//     throw UnimplementedError();
//   }
//
//   @override
//   FormModel getFormByUUID(String uuid) {
//     // TODO: implement getFormByUUID
//     throw UnimplementedError();
//   }
//
//   @override
//   FormModel updateForm(FormModel newForm) {
//     // TODO: implement updateForm
//     throw UnimplementedError();
//   }
// }
