import 'package:filler_doc/app/presentation/providers/TagScreenProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../create_tags/cloud_tags/add_tag_widget.dart';
import '../../../create_tags/cloud_tags/tag_element.dart';
import 'TagElementV3.dart';

class CloudTagsV2 extends StatelessWidget {
  const CloudTagsV2({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
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
                  const AddTagWidget(),
                  ...value.tagsList.map(
                        (item) {
                      return TagElementV3(item);
                    },
                  ),
                ],
              ),
            );
          },
        ));
  }
}
