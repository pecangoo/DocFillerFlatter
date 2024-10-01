import 'package:filler_doc/app/domain/entities/form.dart';
import 'package:filler_doc/app/domain/enums/status_update_form.dart';
import 'package:filler_doc/app/domain/usecases/forms/add_form.dart';
import 'package:filler_doc/app/domain/usecases/forms/delete_form.dart';
import 'package:filler_doc/app/domain/usecases/forms/get_all_forms.dart';
import 'package:filler_doc/app/domain/usecases/forms/get_form_by_id.dart';
import 'package:filler_doc/app/domain/usecases/forms/update_form.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/tag.dart';

class FormScreenProvider extends ChangeNotifier {
  int activeItem = 0;

  final AddForm _addForm;
  final DeleteForm _deleteForm;
  final GetAllForms _getAllForms;
  final GetFormByUUID _getFormByUUID;
  final UpdateForm _updateForm;

  List<FormM> _listForms = [];

  List<FormM> get listForms => _listForms;

  set listForms(List<FormM> value) {
    _listForms = value;
  }

  FormScreenProvider(
      {required AddForm addForm,
      required DeleteForm deleteForm,
      required GetAllForms getAllForms,
      required GetFormByUUID getFormByUUID,
      required UpdateForm updateForm})
      : _updateForm = updateForm,
        _getFormByUUID = getFormByUUID,
        _getAllForms = getAllForms,
        _deleteForm = deleteForm,
        _addForm = addForm {
       updateAllForms();
  }

  Future<void> updateAllForms() async {
    _listForms = await _getAllForms();
  //  print("Forms $listForms");
    notifyListeners();
  }

  Future<List<Tag>> getAllTagsInForm(String uuid) async {

   // int item =
    var allForms = await _getAllForms();
    int item =   allForms.indexWhere((element) => element.uuid == uuid,);

    if (item == -1) {
      return [];
    } else {
      return allForms
         .firstWhere((element) => element.uuid == uuid,)
         .tagList.toList();
    }
  }


  void changeActiveItem(int index) {
    activeItem = index;
    notifyListeners();
  }

  void addNewForm(FormM form) {
    _addForm(form);
     updateAllForms();
    //notifyListeners();
  }

  void deleteForm(String uuid){
  //  print("delete Form");
    activeItem = 0;
    _deleteForm(uuid);
    updateAllForms();
  }

  Future<StatusUpdateForm> updateCurrentFormWithTag(Tag tag, bool delete) async {

    // Что если таг уже существует?
    // просто обновим
    print("TAG86: $tag");

    FormM currentForm = _listForms[activeItem];
    if (delete) {
      currentForm.tagList.removeWhere(
        (element) => element.id == tag.id,
      );
      _updateForm(currentForm);
      notifyListeners();
    } else {

      // Проверим существует ли текущий таг в форме
      // Индекс тэга в списке всех тэгов(если есть(
      if (currentForm.tagList.any((element) {

       return
         element.nameField == tag.nameField &&
             element.tag == tag.tag &&
        element.hint == tag.hint;
      },)){
        print("Exist");
        return Future.value(StatusUpdateForm.exist);
      }

      int index =
          currentForm.tagList.indexWhere((element) => element.id == tag.id);

      if (index != -1) {
        currentForm.tagList[index] = tag;
      } else {
        currentForm.tagList.add(tag);
      }
      _updateForm(currentForm);
    }

    updateAllForms();

    return Future.value(StatusUpdateForm.ok);
  }
}
