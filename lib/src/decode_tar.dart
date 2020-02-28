import 'dart:io';

import 'package:dart_tar/src/tar_file.dart';

class TarDecoder {
  String inputPath;
  String outputPath;
  TarDecoder({this.inputPath, this.outputPath});

  void decode() {
    final inputFile = File(inputPath);
    List<int> inputFileBytes = inputFile.readAsBytesSync();
    var tf = TarFile();
    tf.fileName = String.fromCharCodes(inputFileBytes.sublist(0, 99));
    print(tf.fileName);
    // print(inputFileBytes.toString());
  }
}
