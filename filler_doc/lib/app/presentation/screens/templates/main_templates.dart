import 'package:filler_doc/app/presentation/screens/templates/columns/above_panels/panel_above_list_template.dart';
import 'package:filler_doc/app/presentation/screens/templates/columns/above_panels/panel_above_template_fields.dart';
import 'package:filler_doc/app/presentation/screens/templates/columns/filler/filler_column.dart';
import 'package:filler_doc/app/presentation/screens/templates/columns/templates/column_templates.dart';
import 'package:filler_doc/app/presentation/screens/templates/providers/template_screen_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'columns/fields/field_template.dart';

class TemplateScreen extends StatelessWidget {
  const TemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TemplateScreenProvider>(
        builder: (BuildContext context, TemplateScreenProvider value, child) {
          return const Row(
            children: [
              VerticalDivider(),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    PanelAboveListTemplate(),
                    Divider(),
                    ColumnTemplates(),
                  ],
                ),
              ),
               VerticalDivider(),
             Expanded(flex: 2,
                 child: FieldTemplate(),
             ),
              // Expanded(flex: 2, child: Placeholder()),

              VerticalDivider(),
              Expanded(flex: 2,
                  child: FillerColumn()),
              VerticalDivider(),
            ],
          );
        },
      ),
    );
  }
}
