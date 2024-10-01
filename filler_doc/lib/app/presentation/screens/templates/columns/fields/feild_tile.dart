import 'package:filler_doc/app/domain/entities/template.dart';
import 'package:filler_doc/app/presentation/screens/templates/providers/template_screen_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class FieldTile extends StatefulWidget {
  final TemplateField listField;


  FieldTile(this.listField, {super.key});
  @override
  State<FieldTile> createState() => _FieldTileState();
}


class _FieldTileState extends State<FieldTile> {

  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.listField.value);
  }


  @override
  Widget build(BuildContext context) {
  //  print("RePrint field");
    var prov = Provider.of<TemplateScreenProvider>(context, listen: false);
    return Row(
      children: [
        Expanded(child: Text(widget.listField.nameField)),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
             controller: _controller,
              enabled: prov.editMode,
              onChanged: (value) {
                prov.localUpdateTemplateFieldValue(widget.listField.id, value);
              },
            ),
          ),
        ),
        Tooltip(
          message: "Подсказка: ${widget.listField.hint}\n"
              "Тэг:  ${widget.listField.tag}",
            child: Icon(Icons.question_mark, color: Colors.grey,))
      ],
    );
  }
}