import 'package:filler_doc/app/domain/entities/tag.dart';
import 'package:filler_doc/app/presentation/providers/TagScreenProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DialogAddTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Tag newTag = Tag.empty();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    // TODO: implement build
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
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
                            TextFormField(
                              decoration: const InputDecoration(
                                  label: Text("Тэг"),
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
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                  label: Text("Имя поля"),
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
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                  label: Text("Подсказка"),
                                  border: OutlineInputBorder()),
                              maxLines: 1,
                              maxLength: 20,
                              onSaved: (newValue) {
                                newTag.hint = newValue ?? "";
                              },

                            ),
                          ],
                        ),
                      ),
                    ],
                  ))),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Отмена")),
              ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      await Provider.of<TagScreenProvider>(context, listen: false)
                          .addNewTag(newTag, refresh: true);
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Создать тег"))
            ],
          )
        ],
      ),
    );
  }
}
