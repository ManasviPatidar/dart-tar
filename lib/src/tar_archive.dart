import 'dart:io';
import 'package:collection/collection.dart';
import 'package:chunked_stream/chunked_stream.dart';
import 'package:dart_tar/dart_tar.dart';

class TarArchive {
  Stream<List<int>> inputStream;
  ChunkedStreamIterator<int> iterator;
  int offset = 0;

  TarArchive({String inputPath}) {
    inputStream = File(inputPath).openRead();
    iterator=ChunkedStreamIterator(inputStream);
  }
  Future<bool> readNext() async {
    var tf=TarFile();
    List<int> header = await iterator.read(512);
    if(ListEquality().equals(header,List.filled(512, 0))){
      print('EOF reached!');
      return false;
    }else{
      tf.fileName=String.fromCharCodes(header.sublist(0, 99));
      tf.fileSize = int.parse(
          String.fromCharCodes(
              header.sublist(124, 135)),
          radix: 8);
      print('The file named ${tf.fileName} is of size ${tf.fileSize}');
      var contentSize = (tf.fileSize~/512+1)*512;
      List<int>contents =await iterator.read(contentSize);
      return true;
    }
  }
}
