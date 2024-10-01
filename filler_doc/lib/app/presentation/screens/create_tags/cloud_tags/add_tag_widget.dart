

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dialog_add_tag.dart';

class AddTagWidget extends StatelessWidget {
  const AddTagWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        showDialog(context: context,
          barrierDismissible: false,
          barrierColor: Colors.grey,
            builder: (context) {
              return DialogAddTag();
            },);
      },
      child: Chip(
        backgroundColor: Colors.lime,
        label: Column(children: [
          Text(
         "Добавить"
          ),
          Text("Новый тэг")
        ]),
      ),
    );
  }

}