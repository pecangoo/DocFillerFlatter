import 'package:filler_doc/app/presentation/screens/templates/columns/above_panels/panel_above_template_fields.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/template_screen_provider.dart';
import 'feild_tile.dart';

class FieldTemplate extends StatefulWidget {
  const FieldTemplate({super.key});

  @override
  State<FieldTemplate> createState() => _FieldTemplateState();
}

class _FieldTemplateState extends State<FieldTemplate> {

  Widget _getWidgetByState(TemplateScreenProvider value) {

    var item  = value.listTemplate.indexWhere(
          (element) {
        return element.uuid == value.currentActiveTemplateUUID;
      },
    );

    if (item == -1) {
      return const Center(
        child: Text("Форма по которой "
            "был создан шаблон была пустой или шаблоны отсутствуют",
        ),
      );
    } else {
      var listFields = value.listTemplate.firstWhere(
            (element) {
          return element.uuid == value.currentActiveTemplateUUID;
        },
      ).fields;
      return
        Column(children: [
          const PanelAboveTemplateFields(),
       const Divider(),
        Expanded(
          child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ColoredBox(
                  color: Colors.black12,
                ),
              ),
            );
          },
          itemCount: listFields.length,
          itemBuilder: (BuildContext context, int index) {
            return FieldTile(listFields[index]);
          },
                ),
        )]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TemplateScreenProvider>(
      builder: (context, TemplateScreenProvider value, child) {
        return  _getWidgetByState(value);
      },
    );
  }
}
