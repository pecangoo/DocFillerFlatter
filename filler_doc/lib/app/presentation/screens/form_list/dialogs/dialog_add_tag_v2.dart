import 'package:filler_doc/app/domain/entities/tag.dart';
import 'package:filler_doc/app/presentation/providers/DialogAddTagProvider.dart';
import 'package:filler_doc/app/presentation/providers/FormScreenProvider.dart';
import 'package:filler_doc/app/presentation/providers/TagScreenProvider.dart';
import 'package:filler_doc/app/presentation/screens/form_list/dialogs/cloud_tags_for_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constans/textStyles.dart';


/*
Тег добавляется в текущую форму,а так же в пул тегов.
// Нужно ли удалять теги из пула?
//// Теги можно из пула не удалять.
*/

class DialogAddTagV2 extends StatelessWidget {

  void navigatorPop(BuildContext context){
    if (context.mounted) {
      Navigator.pop(context);
      Provider.of<DialogAddTagProvider>(context, listen: false).cleanControllers();
    }
  }


  @override
  Widget build(BuildContext context) {

  //
    Tag newTag = Tag.empty();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    // TODO: implement build
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Consumer<DialogAddTagProvider>(builder:  (context, value, child) {

            return  Form(
                key: _formKey,
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Consumer(
                                builder: (context, DialogAddTagProvider value, child) {
                                  return TextFormField(
                                    controller: value.controllerTag,
                                    decoration: InputDecoration(
                                        label: Text("Тэг", style: textStyleTitleField),
                                        border: OutlineInputBorder()),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Поле не должно быть пустым";
                                      }
                                    },
                                    maxLines: 1,
                                    maxLength: 20,
                                    onSaved: (newValue) {
                                      newTag.tag = newValue!;
                                    },
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(

                                decoration: InputDecoration(
                                    label: Text("Имя поля", style: textStyleTitleField),
                                    border: OutlineInputBorder()),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Поле не должно быть пустым";
                                  }
                                },
                                maxLines: 1,
                                maxLength: 20,
                                onSaved: (newValue) {
                                  newTag.nameField = newValue!;
                                },
                                controller: value.controllerName,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                    label: Text("Подсказка", style: textStyleTitleField),
                                    border: OutlineInputBorder()),
                                maxLines: 1,
                                maxLength: 20,
                                onSaved: (newValue) {
                                  newTag.hint = newValue ?? "";
                                },
                                controller: value.controllerHint,
                              ),

                            ],
                          ),
                        ),
                      ],
                    )));
          },),

          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceAround,
            children: [
              const Expanded(
                flex: 3,
                  child: SizedBox()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ElevatedButton(
                    onPressed: () {
                      navigatorPop(context);
                    },
                    style: buttonStyleCancelButton,
                    child: Text("Отмена", style: textStyleConfirmButtons,)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Добавляем тег в
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          navigatorPop(context);
                          newTag.id = await Provider.of<TagScreenProvider>(context,
                                  listen: false)
                              .addNewTag(newTag, refresh: true);
                      //  print("New Tag  $newTag");

                          await Provider.of<FormScreenProvider>(context,
                                  listen: false)
                              .updateCurrentFormWithTag(newTag, false);
                        }
                      }
                    },
                    style: buttonStyleConfirmButton,
                    child: Text("Добавить тег к форме", style: textStyleConfirmButtons,)),
              )
            ],
          ),
          CloudTagsForDialog(),
        ],
      ),
    );
  }
}

class Finder extends StatelessWidget {
  const Finder({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: (size.width * 0.3),
      child: TextField(
          onChanged: (value) {
            Provider.of<TagScreenProvider>(context, listen: false)
                .searchingFoo(value);
          },
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              labelText: 'Поиск по тегу или  имени',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))))),
    );
  }
}
