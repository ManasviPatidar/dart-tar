import 'dart:io';
import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:dart_tar/src/tar_file.dart';

class TarDecoder {
  String inputPath;
  String outputPath;
  TarDecoder({this.inputPath, this.outputPath});
  List<int> eof = List.filled(1024, 0);
  void decode() {
    final inputFile = File(inputPath);
    List<int> inputFileBytes = inputFile.readAsBytesSync();
    int offset = 0;
    while (!ListEquality()
        .equals(inputFileBytes.sublist(offset + 0, offset + 1024), eof)) {
      var tf = TarFile();
      tf.fileName =
          String.fromCharCodes(inputFileBytes.sublist(offset + 0, offset + 99));
      tf.fileSize = int.parse(
          String.fromCharCodes(
              inputFileBytes.sublist(offset + 124, offset + 135)),
          radix: 8);
      print(tf.fileName);
      print(tf.fileSize);
      offset += ((tf.fileSize ~/ 512) + 2) * 512;
    }

    // print(inputFileBytes.toString());
  }
}
