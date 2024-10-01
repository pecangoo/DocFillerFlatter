
import 'dart:ui';

import 'package:filler_doc/app/presentation/constans/style_colors.dart';
import 'package:flutter/material.dart';

TextStyle textStyleNameFormInList = TextStyle(color: Colors.black,
fontSize: 16);

TextStyle textStyleDateInList = TextStyle(color: Color.fromARGB(155, 40, 40, 40),
    fontSize: 10);


TextStyle textStyleTitleField = TextStyle(color: Color.fromARGB(74, 0, 0, 0),
    fontSize: 16);


/// Template Tile
TextStyle textStyleNameLabel= TextStyle(color: Color.fromARGB(74, 0, 0, 0),
    fontSize: 12);
TextStyle textStyleName= TextStyle(color: Color.fromARGB(255, 0, 0, 0),
    fontSize: 16, fontWeight: FontWeight.bold);


// Filler Styles
TextStyle textStyleFillerTitle= TextStyle(color: Color.fromARGB(255, 0, 0, 0),
    fontSize: 16);


//Buttons
TextStyle textStyleCancelTextButtons= TextStyle(color: Color.fromARGB(255, 0, 0, 0),
    fontSize: 16);

TextStyle textStyleConfirmButtons= TextStyle(color: Color.fromARGB(255, 0, 0, 0),
    fontSize: 16);


// Other

TextStyle textStyleAddTitleDialog = TextStyle(color: Color.fromARGB(255, 0, 0, 0),
    fontSize: 16, fontWeight: FontWeight.bold);


// AbovePanelTextSty;e

TextStyle textStyleAbovePanel = TextStyle(color: Color.fromARGB(255, 0, 0, 0),
    fontSize: 16, fontWeight: FontWeight.bold);

TextStyle textStyleTabTitle = TextStyle(color: Color.fromARGB(255, 0, 0, 0),
    fontSize: 18, fontWeight: FontWeight.bold);



// ButtonStyles
ButtonStyle buttonStyleConfirmButton = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(colorConfirmButton));




// ButtonStyles
ButtonStyle buttonStyleCancelButton = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(colorCancelButton));


TextStyle textStyleConfirmTextButton= TextStyle(color: colorConfirmButton,
    fontSize: 16, fontWeight: FontWeight.bold);
TextStyle textStyleCancelTextButton= TextStyle(color: colorCancelButton,
    fontSize: 16, fontWeight: FontWeight.bold);
