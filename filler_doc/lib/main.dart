import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:filler_doc/app/data/repositories/form_repository.dart';
import 'package:filler_doc/app/data/repositories/impliments/drift_data_base.dart';
import 'package:filler_doc/app/data/repositories/tag_repository.dart';
import 'package:filler_doc/app/data/repositories/template_repository.dart';
import 'package:filler_doc/app/domain/usecases/forms/add_form.dart';
import 'package:filler_doc/app/domain/usecases/forms/delete_form.dart';
import 'package:filler_doc/app/domain/usecases/forms/get_all_forms.dart';
import 'package:filler_doc/app/domain/usecases/forms/get_form_by_id.dart';
import 'package:filler_doc/app/domain/usecases/forms/update_form.dart';
import 'package:filler_doc/app/domain/usecases/tags/add_tag.dart';
import 'package:filler_doc/app/domain/usecases/tags/get_all_tags.dart';
import 'package:filler_doc/app/domain/usecases/templates/use_cases_templates.dart';
import 'package:filler_doc/app/presentation/providers/DialogAddTagProvider.dart';
import 'package:filler_doc/app/presentation/providers/FormScreenProvider.dart';
import 'package:filler_doc/app/presentation/providers/TagScreenProvider.dart';
import 'package:filler_doc/app/presentation/screens/templates/providers/template_screen_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'app/domain/usecases/tags/delete_tag.dart';
import 'app/presentation/screens/tab_view.dart';

import "utils/apputils.dart" as apputils;

void main() {
  //runApp(const MyApp());


  WidgetsFlutterBinding.ensureInitialized();
  startMeUp() async {
    apputils.docsDir = await getApplicationDocumentsDirectory();
    apputils.tagDataBase = join(apputils.docsDir!.path,"tag_data.db");
    await testWindowFunctions();
    print( apputils.tagDataBase );
    runApp(MyApp());
  }

  startMeUp();


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var repositoryDrift = DriftRepositoryDriftImpl();
    TagRepository tagRepository = repositoryDrift;
    FormRepository formRepository = repositoryDrift;
    TemplateRepository templateRepository = repositoryDrift; //TemplateRepositoryTest();

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => TagScreenProvider(
                  addTag: AddTag(tagRepository),
                  deleteTag: DeleteTag(tagRepository),
                  getAllTag: GetAllTags(tagRepository))),
          ChangeNotifierProvider(
            create: (context) => FormScreenProvider(
                addForm: AddForm(formRepository),
                deleteForm: DeleteForm(formRepository),
                getAllForms: GetAllForms(formRepository),
                getFormByUUID: GetFormByUUID(formRepository),
                updateForm: UpdateForm(formRepository)),
          ),
          ChangeNotifierProvider(create: (context) => DialogAddTagProvider()),
          ChangeNotifierProvider(
              create: (context) => TemplateScreenProvider(
                  useCasesTemplates: UseCasesTemplates(
                      templateRepository: templateRepository)))
        ],
        child: MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: TabView(),
        ));

  }
}



Future testWindowFunctions() async {
  Size size = await DesktopWindow.getWindowSize();
  print(size);
 // DesktopWindow.
  await DesktopWindow.setWindowSize(Size(1200,800));

  await DesktopWindow.setMinWindowSize(Size(1200,800));
 await DesktopWindow.setMaxWindowSize(Size(1800,1200));

 // await DesktopWindow.resetMaxWindowSize();
//  await DesktopWindow.toggleFullScreen();
//  bool isFullScreen = await DesktopWindow.getFullScreen();
 // await DesktopWindow.setFullScreen(true);
  //await DesktopWindow.setFullScreen(false);
}
