
import 'package:filler_doc/app/presentation/constans/textStyles.dart';
import 'package:flutter/material.dart';

import '../../../constans/style_colors.dart';
import '../dialogs/dialog_add_tag_v2.dart';

class PanelAboveTags extends StatelessWidget {
  const PanelAboveTags({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: colorAbovePanels,
      child: Row(
        children: [
          Expanded(
              flex: 7,
              child:
              Align(alignment: Alignment.center, child: Text("Cписок тегов в форме",
                style: textStyleAbovePanel))),
          Expanded(
              flex: 1,
              child: IconButton(
                  tooltip: "Добавить тэг в форму",
                  onPressed: () async {

                    showDialog(context: context,
                      barrierDismissible: false,
                      barrierColor: Colors.grey,
                      builder: (context) {
                        return DialogAddTagV2();
                      },);

                  },
                  icon: Icon(
                    Icons.add_box,
                    color: colorAddFormItem,
                  )))
        ],
      ),
    );
  }
}
