import 'package:filler_doc/app/presentation/providers/TagScreenProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PanelAboveTagCloud extends StatelessWidget {
  const PanelAboveTagCloud({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(

        onChanged: (value) {
          Provider.of<TagScreenProvider>(context, listen: false)
              .searchingFoo(value);
        },
        decoration: const InputDecoration(
          isDense:  true,


            prefixIcon: Icon(Icons.search),
            labelText: 'Поиск по тегу или  имени',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))),
          // contentPadding: EdgeInsets.symmetric(vertical: 0),


        ));
  }
}
