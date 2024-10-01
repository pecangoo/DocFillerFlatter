import 'package:filler_doc/app/presentation/screens/templates/columns/templates/template_tile.dart';
import 'package:filler_doc/app/presentation/screens/templates/providers/template_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColumnTemplates extends StatelessWidget {
  const ColumnTemplates({super.key});

  Widget _getWidgetByState(TemplateScreenProvider value){
    if (value.listTemplate.isEmpty) {
      return Center(child: Text("Список шаблонов пуст"),);
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
          itemCount: value.listTemplate.length,
      itemBuilder: (BuildContext context, int index) {
            return TemplateTile(template: value.listTemplate[index],
            index: index);
      },);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TemplateScreenProvider>(builder: (context,
        TemplateScreenProvider value,
        child) {
      return Expanded(child: _getWidgetByState(value));
    },);
  }
}
