import 'package:filler_doc/app/presentation/constans/textStyles.dart';
import 'package:filler_doc/app/presentation/screens/templates/dialogs/dialog_add_template.dart';
import 'package:flutter/material.dart';
import '../../../../constans/style_colors.dart';

class PanelAboveListTemplate extends StatelessWidget {
  const PanelAboveListTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: colorAbovePanels,
      child: Row(
        children: [
           Expanded(
              flex: 6,
              child:
              Align(alignment: Alignment.center, child: Text("Cписок шаблонов",
              style: textStyleAbovePanel,))),
          Expanded(
              flex: 1,
              child: IconButton(
                  tooltip: "Создать шаблон",
                  onPressed: () async {
                    showDialog(context: context,
                      barrierDismissible: false,
                      barrierColor: Colors.grey,
                      builder: (context) {
                      return DialogAddTemplate();
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
