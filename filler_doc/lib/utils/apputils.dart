import 'dart:ffi';
import 'dart:io';

Directory? docsDir;

String ? tagDataBase;

String fromTimeStampStrToDateTime(int timestamp){
 // int milliseconds = int.parse(timestamp);
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return dateTime.toString().split(".").first;

}