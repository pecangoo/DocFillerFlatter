import 'dart:convert';
import 'dart:io';

import 'package:docx_template/docx_template.dart';

import 'package:archive/archive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:xml/xml.dart';

class AutoFiller {
  static test(String path) async {
    final file = File(path);
    final bytes = await file.readAsBytes();

    // Распаковка .docx файла
    final archive = ZipDecoder().decodeBytes(bytes);

    // Поиск основного документа
    for (final file in archive) {
      if (file.name == 'word/document.xml') {
        // Парсинг XML
        //final xmlContent = String.fromCharCodes(file.content);

        final xmlContent = utf8.decode(file.content);
        final document = XmlDocument.parse(xmlContent);

        // Извлечение текста
        final paragraphs = document.findAllElements('w:p');
        for (var paragraph in paragraphs) {
          final texts =
              paragraph.findAllElements('w:t').map((e) => e.text).join();
          // print(texts);
        }
      } else {
        print(file.name);
      }
    }
  }

  run(String path, final Map<String, String> replacements, String savePath) async {
    print(path);
    final directory = await getApplicationDocumentsDirectory();
  //  print(replacements);
   // print(directory.path);
    // await requestPermission();
    final file = File(path);
    final bytes = await file.readAsBytes();

    // Распаковка .docx файла
    final archive = ZipDecoder().decodeBytes(bytes);
    List<String> namesFilesInDoc  = ["document", "header1",  "footer1"];

    for (var element in namesFilesInDoc) {
      ArchiveFile? archiveFile = _getXmlFle(archive, element);

      if (archiveFile != null) {
        var document = _parseDocument(archiveFile);
        _changeText(document, replacements);

        final modifiedXmlContent = document.toXmlString(pretty: false);
        archiveFile.content = utf8.encode(modifiedXmlContent); //
      }
    }
    // Запись нового .docx файла
    final encoder = ZipEncoder();
    final newArchive = Archive();

    for (final file in archive) {
      newArchive.addFile(ArchiveFile(file.name, file.size, file.content));
    }


    final newBytes = encoder.encode(newArchive);
    print(savePath);
    final newFile = File(savePath);
    await newFile.writeAsBytes(newBytes!);



  }

  /**
   * Get file to editting
   * header1 footer1 document
   */
  ArchiveFile? _getXmlFle(Archive archive, String type) {
    // header1  footer1 document
    String find = 'word/$type.xml';
// FIXME: Тестовая

    // final encoder = ZipEncoder();
    // String testSavePath =  "/Users/svetislavdobromirov/Documents/test";


    for (final file in archive) {
      if (file.name == find) {
        return file;
      }


    }
  }

  /**
   * Parse Document from xmlFile
   */
  XmlDocument _parseDocument(ArchiveFile file) {
    // Парсинг XML
    final xmlContent = utf8.decode(file.content);
    return XmlDocument.parse(xmlContent);
  }

  /**
   * changeText
   */
  _changeText(XmlDocument document, final Map<String, String> replacements) {


    final paragraphs = document.findAllElements('w:p');
    for (var paragraph in paragraphs) {
      final texts = paragraph.findAllElements('w:t');
      for (var text in texts) {
        final originalText = text.text; // .text;

        replacements.keys.forEach(
          (element) {
            if (originalText != null) {

              if (originalText.contains(element)) {
                if (originalText[originalText.length-1] == " "){
                  text.innerText = "${replacements[element]!} " ;
                } else {
                  text.innerText = replacements[element]! ;
                }
              }
            }
          },
        );
      }
    }
  }
}
