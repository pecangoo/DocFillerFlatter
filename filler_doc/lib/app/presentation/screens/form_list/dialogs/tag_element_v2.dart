import 'package:filler_doc/app/presentation/providers/DialogAddTagProvider.dart';
import 'package:filler_doc/app/presentation/providers/TagScreenProvider.dart';
import 'package:filler_doc/app/domain/entities/tag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constans/style_colors.dart';
import '../../../providers/FormScreenProvider.dart';

class TagElementV2 extends StatefulWidget {
  final Tag _tagModel;

  const TagElementV2(this._tagModel, {super.key});

  @override
  State<TagElementV2> createState() => _TagElementState(_tagModel);
}

class _TagElementState extends State<TagElementV2> {
  bool isHovered = false;
  final Tag tag;

  _TagElementState(this.tag);

  @override
  Widget build(BuildContext context) {
    return Consumer<DialogAddTagProvider>(
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () {
            value.idActiveTagInCloud = tag.id!;
            value.changeFormField(tag);
          },
          child: Container(
            decoration: widget._tagModel.isSearch
                ? BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.red, width: 2))
                : null,
            child: Chip(
              onDeleted: () {
                Provider.of<TagScreenProvider>(context, listen: false)
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
                  color: isHovered
                      ? Colors.red
                      : Colors
                          .grey, // isHovered – это булевая переменная вашего состояния
                ),
              ),

              backgroundColor: value.idActiveTagInCloud == tag.id
                  ? colorActiveTag
                  : colorInactiveTag,
              label: Column(children: [
                Text(
                  widget._tagModel.tag,
                ),
                Text(widget._tagModel.nameField)
              ]),
            ),
          ),
        );
      },
    );
  }
}
