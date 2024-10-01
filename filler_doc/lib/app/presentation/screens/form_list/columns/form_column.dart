


import 'package:filler_doc/app/presentation/providers/FormScreenProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../list_items/form_item.dart';

class FormColumn extends StatelessWidget {
  const FormColumn({super.key});

  Widget _getWidgetByState(FormScreenProvider value){
    // Тут два случая.Если форм нет, то сообщение что нет форм

    if (value.listForms.isEmpty){
      return  const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Список форм пуст"),
              Text("Нажмите + чтобы добавить форму"),
            ],
          ));
    } else {

      return ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 3,
            child: Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 10),
              child: ColoredBox(
                color: Colors.black12,
              ),
            ),
          );
        },
        itemCount: value.listForms.length,
        itemBuilder: (BuildContext context, int index) {
          var form = value.listForms[index];
          return FormItem(index,
              value.activeItem == index ? true : false,
              currentForm: form);
        },
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Consumer<FormScreenProvider>(
          builder:
              (context, FormScreenProvider value, child) {
            return _getWidgetByState(value);
          },
        )
    );
  }
}
