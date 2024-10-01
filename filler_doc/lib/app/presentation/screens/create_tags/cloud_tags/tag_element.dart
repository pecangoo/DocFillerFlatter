import 'package:filler_doc/app/presentation/providers/TagScreenProvider.dart';
import 'package:filler_doc/app/domain/entities/tag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constans/style_colors.dart';


class TagElement extends StatefulWidget {
  final Tag _tagModel;

  const TagElement(this._tagModel, {super.key});

  @override
  State<TagElement> createState() => _TagElementState();
}

class _TagElementState extends State<TagElement> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {


    // TODO: implement buil
    return GestureDetector(
      onTap: () {

        Provider.of<TagScreenProvider>(context, listen: false)
            .changeActiveChip(widget._tagModel.id!);

      },
      child: Container(
        decoration: widget._tagModel.isSearch ? BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border:
        Border.all(color: Colors.red,
            width: 2)):null,
        child: Chip(

          onDeleted: (){
            Provider
                .of<TagScreenProvider>(context, listen: false)
                .deleteTag(widget._tagModel);
          },
          deleteIcon: MouseRegion(
            onEnter: (_) {
              setState(() {
                isHovered = true;
              });
            },
            onExit: (_) {
              setState(() {
                isHovered = false;
              });

            },
            child: Icon(
              Icons.delete,
              color: isHovered ? Colors.red : colorOfDeleteBox, // isHovered – это булевая переменная вашего состояния
            ),

          ),
          backgroundColor: widget._tagModel.isActive ? colorActiveTag : colorInactiveTag,
          label: Column(children: [
            Text(
              widget._tagModel.tag,
            ),
            Text(widget._tagModel.nameField)
          ]),
        ),
      ),
    );
  }
}
