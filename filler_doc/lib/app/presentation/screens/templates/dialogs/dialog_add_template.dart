


import 'package:filler_doc/app/domain/entities/template.dart';
import 'package:filler_doc/app/presentation/constans/textStyles.dart';
import 'package:filler_doc/app/presentation/providers/FormScreenProvider.dart';
import 'package:filler_doc/app/presentation/screens/templates/providers/template_screen_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../columns/above_panels/form_field_with_drop_button.dart';

class DialogAddTemplate extends StatefulWidget {
   DialogAddTemplate({super.key});

  @override
  State<DialogAddTemplate> createState() => _DialogAddTemplateState();
}

class _DialogAddTemplateState extends State<DialogAddTemplate> {
  List<String> listString = [];

  @override
  Widget build(BuildContext context) {

    var provider = Provider
        .of<TemplateScreenProvider>(context, listen: false);

    if(listString.isEmpty){
      listString = Provider
          .of<FormScreenProvider>(context)
          .listForms
          .map((e) => e.nameForm).toList();
    }
    return SimpleDialog(
      children: [
        Form(

          key: provider.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(children: [
              Text("Введите название шаблона", style: textStyleAddTitleDialog),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  maxLength: 32,
                  validator: (value) {
                    if (value!.length < 3)
                      return "Длина названия шаблона минимум 3 симвоал";

                    var errorExist = Provider.of<TemplateScreenProvider>(context,
                        listen:  false)
                        .listTemplate
                        .any((element) => element.nameTemplate == value);

                    if (errorExist) {
                      return "Имя шаблона не должно повторятся";
                    }
                  } ,
                  onSaved:  (newValue) {
                    provider.updateTemplate(nameTemplate: newValue);
                  },
                  decoration: InputDecoration(labelText: "Название шаблона", ),),
              ),

              Tooltip(
                message: "Выберите форму по которой создастся шаблон",
                child: Row(children: [
                  const Expanded(
                      flex: 2,
                      child: Text("Выберите форму")),
                  Expanded(
                    flex: 3,
                    child: FormFieldWithDropButton(listString),),
                ],),
              ),


              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment:  MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: buttonStyleCancelButton,
                        child: Text("Отмена", style: textStyleConfirmButtons,)),
                    ElevatedButton(
                      style: buttonStyleConfirmButton,
                        onPressed: () async {
                          var prov = Provider.of<TemplateScreenProvider>(context, listen: false);
                          if(prov.formKey.currentState!.validate()){
                            prov.formKey.currentState!.save();

                            var formProv = Provider.of<FormScreenProvider>(context, listen: false);

                            var tagList = await
                            formProv
                                 .getAllTagsInForm(prov.currentNewTemplate!.uuidParentForm);

                             int i = 0;

                            List<TemplateField> listTemplateFields =  tagList.map((e) {
                              return TemplateField(i++, e.nameField, e.tag, e.hint);
                            },).toList();
                           //
                            print(listTemplateFields);
                           prov.currentNewTemplate!.fields = listTemplateFields;
                           //
                           prov.addTemplate();

                           if(context.mounted) {
                              Navigator.pop(context);
                            }
                          }
                        },
                        child: Text("Создать шаблон", style: textStyleConfirmButtons,))
                  ],
                ),
              )
            ]),
          ),
        )
      ],
    );
  }
}
