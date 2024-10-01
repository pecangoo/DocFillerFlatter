import 'package:filler_doc/app/presentation/constans/style_colors.dart';
import 'package:filler_doc/app/presentation/constans/textStyles.dart';
import 'package:filler_doc/app/presentation/screens/form_list/main_form_list_page.dart';
import 'package:filler_doc/app/presentation/screens/templates/main_templates.dart';
import 'package:flutter/material.dart';

import 'create_tags/cloud_tags/main_cloud_tags_screen.dart';

class TabView extends StatelessWidget {
  TabView({super.key});

  List<Tab> myTabs = <Tab>[
    //   Tab(text: 'Создать форму'/* CloudTagsScreen()*/,),
    Tab(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(child: Text('Список форм')),
      ),
    ),
    Tab(
        child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Center(child: Text("Список шаблонов")))),
    // Tab(text: 'Список шаблонов',  style: textStyleTabTitle,),
  ];

  List<Widget> myTabViews = <Widget>[
    //   CloudTagsScreen(), // Для первой вкладки
    FormListPage(), // Для второй вкладки
    TemplateScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicator: BoxDecoration(color: colorAbovePanels),
            labelStyle: textStyleTabTitle,
            tabs: myTabs,
          ),
        ),
        body: TabBarView(children: myTabViews
            // ),
            ),
      ),
    );
  }
}
