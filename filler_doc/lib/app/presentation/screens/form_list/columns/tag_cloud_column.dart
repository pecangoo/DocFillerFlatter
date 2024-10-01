import 'package:filler_doc/app/presentation/screens/form_list/above_panels/panel_above_tag_cloud.dart';
import 'package:filler_doc/app/presentation/screens/form_list/columns/cloud_tags/cloud_tags_column.dart';
import 'package:flutter/material.dart';

class TagCloudColumn extends StatelessWidget {
  const TagCloudColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        //mainAxisSize: MainAxisSize.min,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [PanelAboveTagCloud(),
          Divider(),
          Expanded(child: CloudTagsV2())]);
  }
}
