import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:filler_doc/app/presentation/screens/form_list/ui_utils/scaf_msges.dart';
import 'package:filler_doc/app/presentation/screens/templates/providers/template_screen_provider.dart';
import 'package:filler_doc/utils/apputils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constans/textStyles.dart';

class FillerColumn extends StatelessWidget {
  const FillerColumn({super.key});

  void openDocumentsDirectory(String path) {
    if (Platform.isWindows) {
      //   path = '${Platform.environment['USERPROFILE']}\\Documents';
      Process.run('explorer.exe', [path]);
    } else if (Platform.isMacOS) {
      //   path = '${Platform.environment['HOME']}/Documents';
      Process.run('open', [path]);
    } else {
      print('Недоступно на этой платформе.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TemplateScreenProvider>(
      builder: (context, TemplateScreenProvider value, child) {
        return Center(
          child: (value.listTemplate.isNotEmpty &&
                  value.currentActiveTemplateUUID.isNotEmpty)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Выберите шаблон для заполнения",
                        style: textStyleFillerTitle,
                      ),
                    ),
                    //Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Tooltip(
                            message: value.fileDocument == null
                                ? ""
                                : value.fileDocument!.path,
                            child: Text(
                                value.fileDocument == null
                                    ? "Файл не выбран"
                                    : value.fileDocument!.name,
                                overflow: TextOverflow.visible),
                          ),
                        ),
                        Tooltip(
                          message: "Нажмите, чтобы открыть шаблонный документ",
                          child: IconButton(
                            icon: const Icon(Icons.file_open),
                            onPressed: () async {
                              if (value.buttonBusy) {
                                return;
                              } else {
                                value.buttonBusy = true;
                              }
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles(
                                      lockParentWindow: true,
                                      dialogTitle: "Выберите "
                                          "документ для "
                                          "заполнения",
                                      type: FileType.custom,
                                      allowedExtensions: ['doc', 'docx']);
                              if (result != null) {
                                value.changeFilePath(result.files.single);
                              }
                              print(("EXIT WINDOWS"));
                              value.buttonBusy = false;
                            },
                          ),
                        )
                      ],
                    ),
                    Tooltip(
                      message: "Не забудьте сохранить шаблон",
                      child: TextButton(
                          onPressed: () async {
                            // FIXME Логический кошмар в UI!

                            // Проверим, на наличие пустых полей.
                            // Если есть пустые поля, кидаем предупреждение
                            if (!value.isFieldOfCurrentTemplateFull()){
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Все значения в шаблоне должны быть заполнены",
                                      style: TextStyle(color: Colors.black), // Задаем цвет текста
                                    ),
                                  ),
                                  backgroundColor: Colors.yellow, // Цвет фона SnackBar
                                  duration: Duration(seconds: 2), // Длительность отображения
                                ),

                              );
                              return;
                            }


                            if (value.buttonBusy) {
                              return;
                            } else {
                              value.buttonBusy = true;
                            }

                            if (value.fileDocument == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  showCustomSnackBar(
                                      description: "Файл не выбран",
                                      duration: 2,
                                      color: Colors.red));
                            } else {
                              String? documentsDirPath;
                              String? documentsPath;
                              if (Platform.isMacOS) {
                                String? homeDirectory =
                                    Platform.environment['HOME'];
                                documentsDirPath = '$homeDirectory/Documents';
                              } else if (Platform.isWindows) {
                                documentsDirPath =
                                    Platform.environment['USERPROFILE']! +
                                        r'\Documents';
                              }

                              var saveDirectory =
                                  await FilePicker.platform.getDirectoryPath(
                                dialogTitle: "Выберите папку для сохранения",
                                initialDirectory: documentsDirPath,
                                lockParentWindow:
                                    true, // FIXME не будет ожидаемо работать
                              );

                             // print("Save Directory: ${saveDirectory}");
                              if (saveDirectory != null) {
                                if (Platform.isMacOS) {
                                  documentsPath =
                                      "$saveDirectory/${DateTime.now().toString()}${value.fileDocument!.name}";
                                } else if (Platform.isWindows) {
                                  documentsPath = saveDirectory! +
                                      r"\" +
                                      "${DateTime.now().toString()}${value.fileDocument!.name}";
                                }
                                await value.fillDoc(documentsPath).then(
                                  (value) {
                                    String msg = "";
                                    late Color color;
                                    if (value > 0) {
                                      msg = "Успешно сохранен";
                                      color = Colors.green;
                                      openDocumentsDirectory(saveDirectory!);
                                    } else {
                                      msg = "Ошибка при сохранении";
                                      color = Colors.red;
                                    }
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        showCustomSnackBar(
                                            description: msg,
                                            duration: 2,
                                            color: color));
                                  },
                                );
                              }
                            }
                            value.buttonBusy = false;

                          },
                          child: Text("Заполнить", style: textStyleConfirmTextButton,)),
                    ),
                  ],
                )
              : Row(),
        );
      },
    );
  }
}
