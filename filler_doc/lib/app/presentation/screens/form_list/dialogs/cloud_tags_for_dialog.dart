import 'package:filler_doc/app/presentation/screens/form_list/dialogs/tag_element_v2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/TagScreenProvider.dart';


class CloudTagsForDialog extends StatelessWidget {
  const CloudTagsForDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        primary: true,
        child: Consumer(
          builder: (BuildContext context, TagScreenProvider value, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                clipBehavior: Clip.hardEdge,
                spacing: 8.0, // расстояние между элементами по горизонтали
                runSpacing: 8.0, // расстояние между строками
                children: [
                  ...value.tagsList.map(
                    (item) {
                      return  TagElementV2(item);
                    },
                  ),
                ],
              ),
            );
          },
        ));
  }
}
