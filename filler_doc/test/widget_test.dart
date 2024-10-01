// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:filler_doc/app/data/models/tag_model.dart';
import 'package:filler_doc/app/data/repositories/impliments/drift_data_base.dart';
import 'package:filler_doc/app/data/repositories/tag_repository.dart';


void main()  async {
 await testDB();

 print("object7");
}


Future<void> testDB() async {

  TagRepository repository = DriftRepositoryDriftImpl();
  TagModel tagModel  = TagModel(id: 1, nameField: "Имя поля", tag: "Таг поля");

  await repository.addTag(tagModel);

  var value = await repository.getAllTags();
  print("object");
  print(value.length);
    value.forEach((element) {
      print(element);
    },);


}