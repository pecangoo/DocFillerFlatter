import 'package:filler_doc/app/presentation/providers/TagScreenProvider.dart';
import 'package:filler_doc/app/presentation/screens/create_tags/cloud_tags/cloud_tags_original.dart';
import 'package:filler_doc/app/presentation/screens/create_tags/cloud_tags/tag_element.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'add_tag_widget.dart';

class CloudTagsScreen extends StatelessWidget {
  const CloudTagsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: (size.width * 0.3),
              child: TextField(
                onChanged: (value) {},
                decoration: const InputDecoration(
                    labelText: 'Имя формы', border: UnderlineInputBorder()),
              ),
            ),
            SizedBox(
                // width: (size.width * 0.3),
                child: ElevatedButton(
                    onPressed: () {}, child: Text("Создdть форму"))),
          ],
        ),
      ),
      appBar: AppBar(
          title: Align(
        alignment: Alignment.centerRight,
        child: Row(
          children: [
            SizedBox(
              width: (size.width * 0.66),
            ),
            SizedBox(
              width: (size.width * 0.3),
              child: TextField(
                  onChanged: (value) {
                    Provider.of<TagScreenProvider>(context, listen: false)
                        .searchingFoo(value);
                  },
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      labelText: 'Поиск по тегу или  имени',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(50))))),
            ),
          ],
        ),
      )),
      body: const CloudTagsOriginal(),
    );
  }
}
