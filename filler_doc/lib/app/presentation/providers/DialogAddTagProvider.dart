import 'dart:io';

import 'package:filler_doc/app/domain/entities/tag.dart';
import 'package:flutter/cupertino.dart';

class DialogAddTagProvider extends ChangeNotifier {



  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerTag = TextEditingController();
  final TextEditingController controllerHint = TextEditingController();

  int _idActiveTagInCloud = -1;

  int get idActiveTagInCloud => _idActiveTagInCloud;

  set idActiveTagInCloud(int value)  {
    _idActiveTagInCloud = value;
    notifyListeners();
    makeTickOfTagButton();
  }

  Future<void>  makeTickOfTagButton() async{
    await Future.delayed(const Duration(milliseconds: 600));
    _idActiveTagInCloud = -1;
    notifyListeners();
  }

  void cleanControllers(){
    controllerName.text = "";
    controllerTag.text = "";
    controllerHint.text = "";
  }

  void changeFormField(Tag tag){

    controllerName.text = tag.nameField;
    controllerTag.text = tag.tag;
    controllerHint.text = tag.hint;

    notifyListeners();
  }
}