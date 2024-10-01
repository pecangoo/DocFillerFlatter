

// Имя
// Тэг
// Подсказка
//

import 'package:filler_doc/app/presentation/providers/FormScreenProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/entities/tag.dart';
import '../../utils/delete_agreement_dialog.dart';
import '../ui_utils/red_icon.dart';

class TagItem extends StatelessWidget {
  final Tag tag;
  const TagItem({required this.tag, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: Tooltip(
            message: "Пример: ${tag.hint}",
            child: Column(
              children: [
                Text("Название: ${tag.nameField}"),
                Text("Тэг: ${tag.tag}"),
              ]
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: RedIcon(action: () async {

              var res = await deleteAgreementDialog(context, "тег из формы");
              if(res == 1 ) {
                Provider.of<FormScreenProvider>(context, listen: false).updateCurrentFormWithTag(tag, true);
              }
            },

                icon: Icons.cancel_outlined,
            hint: "Удалить тег из формы")
        ),
      ],
    );
  }
}
