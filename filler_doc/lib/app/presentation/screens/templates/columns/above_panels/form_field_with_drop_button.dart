import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/FormScreenProvider.dart';
import '../../providers/template_screen_provider.dart';
class FormFieldWithDropButton extends StatefulWidget {
  final List<String> _listString;

  const FormFieldWithDropButton(this._listString, {super.key});

  @override
  State<FormFieldWithDropButton> createState() => _FormFieldWithDropButtonState();
}

class _FormFieldWithDropButtonState extends State<FormFieldWithDropButton> {
  List<String> _currencies = [];
  String? _currentSelectedValue;
  bool firstTap = false;

  @override
  void initState() {
    super.initState();
    _currencies = widget._listString;
    _currentSelectedValue = _currencies.isNotEmpty ? _currencies[0] : null;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      onSaved: (newValue) {
        var listForms = Provider.of<FormScreenProvider>(context, listen: false).listForms;
        var form = listForms.firstWhere((element) {
         return element.nameForm == newValue;
        },);

        Provider
            .of<TemplateScreenProvider>(context, listen: false)
            .updateTemplate(parentFormUUID: form.uuid);
      },


      //     () {
      //   // Получаем UUID выбранной формы
      //
      //   // Присваиваем
      //
      //  // Provider.of<FormScreenProvider>(context, listen: false)
      //
      //     //(context, listen: false);//.listForms;
      //
      //   // Provider.of<TemplateScreenProvider>(context, listen: false).currentParentForm;
      // },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Выберите форму";
        }
        return null;
      },
      builder: (field) {
        return InputDecorator(
          decoration: InputDecoration(
            errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            errorText: field.hasError ? field.errorText : null, // Отображение ошибки
          ),
          isEmpty: _currentSelectedValue == null || _currentSelectedValue!.isEmpty,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              onTap: () {
                setState(() {
                  firstTap = true;
                });
              },
              value: firstTap ? _currentSelectedValue : null,
              isDense: true,
              onChanged: (String? newValue) {
                setState(() {
                  _currentSelectedValue = newValue;
                  field.didChange(newValue); // Обновляем состояние поля
                });
              },
              items: _currencies.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}