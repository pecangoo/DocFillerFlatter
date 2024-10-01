import 'package:filler_doc/app/presentation/providers/FormScreenProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constans/textStyles.dart';

class DialogGetNameForm extends StatelessWidget {
  const DialogGetNameForm({super.key});

  @override
  Widget build(BuildContext context) {
    String? nameForm;
    GlobalKey<FormState> key = GlobalKey();
    return SimpleDialog(
      children: [
        Form(
            key: key,
            child: Column(
              children: [
                Text("Введите имя формы", style: textStyleAddTitleDialog),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    maxLength: 40,
                    validator: (value) {
                      if (value!.length < 3) {
                        return "Минимальная длина 3 символа";
                      }

                      var errorExist = Provider.of<FormScreenProvider>(context,
                      listen:  false)
                          .listForms
                          .any((element) => element.nameForm == value);

                      if (errorExist) {
                        return "Имя формы не должно повторятся";
                      }
                    },
                    onSaved: (newValue) {
                      nameForm = newValue;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: buttonStyleCancelButton,
                          child: Text(
                            "Отмена",
                            style: textStyleConfirmButtons,
                          )),
                      ElevatedButton(
                          onPressed: () async {
                            if (key.currentState!.validate()) {
                              key.currentState!.save();
                              if (context.mounted) {
                                Navigator.pop(context, nameForm!);
                              }
                            }
                          },
                          style: buttonStyleConfirmButton,
                          child: Text("Создать форму",
                              style: textStyleConfirmButtons))
                    ],
                  ),
                )
              ],
            ))
        //TextField(onChanged: (),)
      ],
    );
  }
}
