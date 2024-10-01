



import 'package:filler_doc/app/domain/usecases/tags/add_tag.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../../domain/entities/tag.dart';
import '../../domain/usecases/tags/delete_tag.dart';
import '../../domain/usecases/tags/get_all_tags.dart';

class TagScreenProvider extends ChangeNotifier {
    final AddTag _addTag;
    final GetAllTags _getAllTag;
    final DeleteTag _deleteTag;


    List<Tag> tagsList  = [];
    List<int> activeElementListID = [];

  TagScreenProvider({required AddTag addTag,
    required GetAllTags getAllTag,
    required DeleteTag deleteTag})
      : _deleteTag = deleteTag, _getAllTag = getAllTag, _addTag = addTag {
       // tagsList =  _getAllTag();\
    _getAllTagsFoo();
    }


    void _getAllTagsFoo() async {
      tagsList = await _getAllTag();
      tagsList.forEach((element) {
        if(activeElementListID.contains(element.id)){
          element.isActive = true;
        }
      },);
      notifyListeners();
    }

    Future<int> addNewTag(Tag tag, {bool refresh = true}) async{

      int containsTag () {
        for (var element in tagsList) {
          if(element.nameField  == tag.nameField
          && element.tag == tag.tag &&
              element.hint == tag.hint) {
              return element.id!;
          }
        };
        return -1;
      }

       // print(tagsList);

        // FIXME: А нужно ли id здесь?
        // int maxId = 0;
        // tagsList.forEach((element) {
        //     if (element.id > maxId) {
        //       maxId = element.id;
        //     }
        // },);
        // maxId++;
        // tag.id = maxId;

        /// Если тег существует, не добавляем
        /// Проверяем наличие
        ///
        ///
        late int  idNewTag;

        int resID = containsTag();
        if(resID == -1) {
          idNewTag = await _addTag(tag);
        } else {
          print("Tag LIST: ${tagsList}");
          print("Tag: ${tag}");
          idNewTag = resID;
        }


        _getAllTagsFoo();
        if (refresh){
          notifyListeners();
        }
      return idNewTag;
    }

    void changeActiveChip(int id){
        tagsList.where((element) {
          return element.id == id;
        },).forEach((element) {
          element.isActive = !element.isActive;
          if ( element.isActive) {
            activeElementListID.add(element.id!);
          } else {
            activeElementListID.remove(id);
          }
        },);

        notifyListeners();
    }

    void deleteTag(Tag tag) {
        _deleteTag(tag);
        activeElementListID.remove(tag.id);
        _getAllTagsFoo();
        notifyListeners();
    }

    void  searchingFoo(String strForSearch) {

        tagsList.forEach((element) {
            if ( (element.nameField.contains(strForSearch) || element.tag.contains(strForSearch)) && strForSearch.isNotEmpty ){
                element.isSearch = true;
            } else {
                element.isSearch = false;
            }
            notifyListeners();
        },);
    }

    void refresh(){
        notifyListeners();
    }
}