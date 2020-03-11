import 'dart:io';
import 'dart:convert';
import 'package:dart_tar/src/tar_file.dart';

class TarDecoder {
  String inputPath;
  String outputPath;
  TarDecoder({this.inputPath, this.outputPath});
  int octalToDecimal(int n) {
    var dec_value = 0;

    // Initializing base value to 1, i.e 8^0
    var base = 1;

    var temp = n;
    while (temp > 0) {
      // Extracting last digit
      var last_digit = temp % 10;
      temp = temp ~/ 10;

      // Multiplying last digit with appropriate
      // base value and adding it to dec_value
      dec_value += last_digit * base;

      base = base * 8;
    }
    return dec_value;
  }

  void decode() {
    final inputFile = File(inputPath);
    List<int> inputFileBytes = inputFile.readAsBytesSync();
    var tf = TarFile();
    tf.fileName = String.fromCharCodes(inputFileBytes.sublist(0, 99));
    tf.fileSize = octalToDecimal(
        int.parse(String.fromCharCodes(inputFileBytes.sublist(124, 135))));
    print(tf.fileName);
    print(tf.fileSize);

    // print(inputFileBytes.toString());
  }
}
