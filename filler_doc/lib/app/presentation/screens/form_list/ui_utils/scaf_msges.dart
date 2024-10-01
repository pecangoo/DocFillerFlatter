

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
//




SnackBar showCustomSnackBar({Color color = Colors.green,
  int duration = 2,
  String description = "Описание Snack Bar"}) {
  return SnackBar(
    backgroundColor: color,
    duration: Duration(seconds: duration),
    content: Text(description, textAlign:  TextAlign.center,),
  );
}