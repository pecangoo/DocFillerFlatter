


import 'package:filler_doc/app/presentation/constans/textStyles.dart';
import 'package:flutter/material.dart';

Future<int?> deleteAgreementDialog(BuildContext context, String whatDelete) async {
  var res = await showDialog(context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("Вы действительно хотите удалить $whatDelete?", style: textStyleAddTitleDialog,),
          actions: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                TextButton(onPressed: () {
                  Navigator.pop(context, 0);
                }, child: Text("Отмена", style: textStyleConfirmTextButton,)),
                TextButton(onPressed: () {
                  Navigator.pop(context, 1);
                }, child: Text("Удалить", style: textStyleCancelTextButton,))
              ],)
            ],)
          ],
        );
      },);

  return res;
}