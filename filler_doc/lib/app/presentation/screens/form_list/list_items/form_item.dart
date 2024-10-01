import 'package:filler_doc/app/domain/entities/form.dart';
import 'package:filler_doc/app/presentation/providers/FormScreenProvider.dart';
import 'package:filler_doc/app/presentation/screens/form_list/ui_utils/red_icon.dart';
import 'package:filler_doc/app/presentation/screens/utils/delete_agreement_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/apputils.dart';
import '../../../constans/style_colors.dart';
import '../../../constans/textStyles.dart';

class FormItem extends StatelessWidget {
  final FormM currentForm;
  final int index;
  bool isActive;
  FormItem(this.index, this.isActive, {required this.currentForm, super.key});

  // Название типа топ.
  // Дата создания
  // Место под есть Есть ли черновик
  // Кнопка перехода
  // Инфо при наведении
  // Номер
  // Возможность редактирования(?)
  // Изменения имени/содержания.

  @override
  Widget build(BuildContext context) {
    //print(MediaQuery.of(context).size);
    return GestureDetector(
      onTap: (){
        Provider.of<FormScreenProvider>(context, listen: false).changeActiveItem(index);
      },
      child: ColoredBox(
        color: isActive ? colorActiveItem : Colors.transparent,
        child: Row(
         // mainAxisSize: MainAxisSize.min,
          children: [
          Expanded(
            flex: 1,
            child: Column(
             // mainAxisAlignment: MainAxisAlignment.start,
                     //   mainAxisSize: MainAxisSize.min,
              children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text((index+1).toString()),
              ),

            ],),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Text(this.currentForm.nameForm, style: textStyleName,),
                  Text("Date: ${fromTimeStampStrToDateTime(currentForm.timestamp)}", style: textStyleDateInList,)
              ],),
            ),
          ),
            Expanded(
                flex:1,
                child: RedIcon(action: () async {
                var res =  await deleteAgreementDialog(context, "форму");
                if(res == 1) {
                  Provider
                      .of<FormScreenProvider>(context, listen: false)
                      .deleteForm(currentForm.uuid);
                }
                },
                hint: "Удалить форму",)),
        ],
        ),
      ),
    );
  }
}
