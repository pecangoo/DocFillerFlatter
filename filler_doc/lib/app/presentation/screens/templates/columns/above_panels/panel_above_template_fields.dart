import 'package:filler_doc/app/presentation/constans/textStyles.dart';
import 'package:filler_doc/app/presentation/screens/templates/providers/template_screen_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../../constans/style_colors.dart';

class PanelAboveTemplateFields extends StatelessWidget {
  const PanelAboveTemplateFields({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<TemplateScreenProvider>(context,
        listen:  false);
    return
      Consumer<TemplateScreenProvider>(builder: (context, value, child) {
        return
          (value.listTemplate.isNotEmpty && value.currentActiveTemplateUUID.isNotEmpty) ?
          ColoredBox(
            color: colorAbovePanels,
            child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Tooltip(
                  message: "Режим редактирования",
                  child: Switch(
                    activeColor: colorAddFormItem,
                    activeTrackColor: colorActiveTag,
                    inactiveThumbColor: Colors.red,
                    value: prov.editMode,
                    onChanged: (value) {
                      prov.changeEditMode(value);
                    },),
                ),
              ),
               Expanded(
                  flex: 4,
                  child: Align(
                      alignment: Alignment.center,
                      child: prov.isDraft ? const Text("Черновик") : null,

                  )),
              Expanded(
                flex: 5,
                child: Tooltip(
                  message: "Сохранить черновик в базу данных\n"
                      "Данные сохранятся после перезапуска",
                  child: TextButton(onPressed: () {

                    var res  = 1;
                    try{
                      value.saveAllFieldsToDatabase();
                    } on Exception catch (_, ex){
                      res = -1;
                    } finally {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: res == 1? Colors.green : Colors.red,
                          duration: const Duration(seconds: 2),
                          content: Text(res == 1 ? "Сохраненр" : "Ошибка", textAlign:  TextAlign.center,),
                        )
                      );
                    }



                  },
                      child: Text("Сохранить", style: textStyleConfirmTextButton,)),
                ),
              )
            ],

                    ),
          ) : const Row();
      },);

  }
}
