import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/FormScreenProvider.dart';
import '../above_panels/panel_above_tags.dart';
import '../dialogs/dialog_add_tag_v2.dart';
import '../list_items/tag_item.dart';

class TagColumn extends StatelessWidget {
  const TagColumn({super.key});

  Widget _getWidgetByState(FormScreenProvider value){
      if(value.listForms.isEmpty) {
        return const NoForms();
      } else if (value.listForms[value.activeItem].tagList.isEmpty) {
        return const NoTagsInForm();
      } else {
        return ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 3,
              child: ColoredBox(
                color: Colors.black12,
              ),
            );
          },
          itemCount:
          value.listForms[value.activeItem].tagList.length,
          itemBuilder: (BuildContext context, int index) {
            var tag =
            value.listForms[value.activeItem].tagList[index];
            return TagItem(tag: tag);
          },
        );
      }
  }


  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Consumer<FormScreenProvider>(
        builder: (context, value, child) {
          return Column(
            children: [
              PanelAboveTags(),
              Divider(),
              Expanded(
                child: _getWidgetByState(value)
              )
            ],
          );
        },
      ),
    );
  }
}

class NoTagsInForm extends StatelessWidget {
  const NoTagsInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Тэгов в форме нет."),
        TextButton(
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                barrierColor: Colors.grey,
                builder: (context) {
                  return DialogAddTagV2();
                },
              );
            },
            child: const Text("Добавить тэг"))
      ],
    ));
  }
}

class NoForms extends StatelessWidget {
  const NoForms({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Сначала создайте форму"),
          ],
        ));
  }
}


