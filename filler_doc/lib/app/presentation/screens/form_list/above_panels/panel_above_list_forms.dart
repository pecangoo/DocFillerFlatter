import 'package:filler_doc/app/domain/entities/form.dart';
import 'package:filler_doc/app/presentation/providers/FormScreenProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constans/style_colors.dart';
import '../../../constans/textStyles.dart';
import '../dialogs/dialog_get_name_form.dart';

class PanelAboveListForms extends StatelessWidget {
  const PanelAboveListForms({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: colorAbovePanels,
      child: Row(

        children: [
          Expanded(
              flex: 6,
              child:
                  Align(alignment: Alignment.center, child: Text("Cписок форм",
                    style: textStyleAbovePanel))),
          Expanded(

              flex: 1,
              child: IconButton(
                  tooltip: "Создать форму",
                  onPressed: () async {
                    final String? nameForm = await showDialog(
                      barrierDismissible: false,
                      barrierColor: Colors.grey,
                      context: context,
                      builder: (context) {
                        return const DialogGetNameForm();
                      },
                    );
                    print(nameForm);
                    if ( nameForm != null) {
                      Provider.of<FormScreenProvider>(context, listen: false)
                          .addNewForm(
                        FormM(nameForm: nameForm, tagList: []),
                      );
                    }
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
