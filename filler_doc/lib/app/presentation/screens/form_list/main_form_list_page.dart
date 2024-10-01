import 'package:filler_doc/app/presentation/providers/FormScreenProvider.dart';
import 'package:filler_doc/app/presentation/screens/form_list/above_panels/panel_above_tag_cloud.dart';
import 'package:filler_doc/app/presentation/screens/form_list/columns/tag_cloud_column.dart';

import 'package:filler_doc/app/presentation/screens/form_list/list_items/form_item.dart';
import 'package:filler_doc/app/presentation/screens/form_list/above_panels/panel_above_list_forms.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'columns/form_column.dart';
import 'columns/tag_column.dart';

class FormListPage extends StatelessWidget {
  const FormListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FormScreenProvider>(
        builder: (BuildContext context, FormScreenProvider value, child) {

            return const Row(
              children: [
                VerticalDivider(),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                     // Divider(),
                      PanelAboveListForms(),
                      Divider(),
                      FormColumn(),
                    ],
                  ),
                ),
                VerticalDivider(),
                TagColumn(),
                VerticalDivider(),
              Expanded(flex:2,
                child: TagCloudColumn()),
                VerticalDivider(),
              ],
            );

        },
      ),
    );
  }
}
