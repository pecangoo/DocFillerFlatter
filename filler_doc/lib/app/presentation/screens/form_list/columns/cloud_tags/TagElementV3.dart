import 'package:filler_doc/app/domain/enums/status_update_form.dart';
import 'package:filler_doc/app/presentation/providers/DialogAddTagProvider.dart';
import 'package:filler_doc/app/presentation/providers/FormScreenProvider.dart';
import 'package:filler_doc/app/presentation/screens/form_list/ui_utils/scaf_msges.dart';
import 'package:filler_doc/app/presentation/screens/form_list/ui_utils/red_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../domain/entities/tag.dart';
import '../../../../constans/style_colors.dart';

class TagElementV3 extends StatefulWidget {
  final Tag _tagModel;

  const TagElementV3(this._tagModel, {super.key});

  @override
  State<TagElementV3> createState() => _TagElementState(_tagModel);
}

class _TagElementState extends State<TagElementV3> {
  bool isHovered = false;
  final Tag tag;

  _TagElementState(this.tag);

  @override
  Widget build(BuildContext context) {
    return Consumer<DialogAddTagProvider>(
      builder: (context, value, child) {
        return Container(
          decoration: widget._tagModel.isSearch
              ? BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.red, width: 2))
              : null,
          child: Chip(
            onDeleted: () {
              // print("Update");
            },
            deleteIcon: RedIcon(
              action: () {
               // print("Old Tag  $tag");
                Provider.of<FormScreenProvider>(context, listen: false)
                    .updateCurrentFormWithTag(tag, false)
                    .then(
                  (value) {
                    if (value == StatusUpdateForm.exist) {
                      return ScaffoldMessenger.of(context).showSnackBar(
                        showCustomSnackBar(
                            description: "Тэг уже существует в форме",
                            duration: 2,
                            color: Colors.blue),
                      );
                    }
                  },
                );
              },
              icon: Icons.add,
              hint: "Добавить тег в форму",
              color: colorAddFormItem,
            ),
            backgroundColor: colorInactiveTag,
            label: Column(children: [
              Text(
                widget._tagModel.tag,
              ),
              Text(widget._tagModel.nameField)
            ]),
          ),
        );
      },
    );
  }
}
