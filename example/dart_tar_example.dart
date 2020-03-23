import 'package:dart_tar/dart_tar.dart';

void main()async{
  var tarArchive = TarArchive(inputPath: 'gnu.tar');
  while(true){
    if(!(await tarArchive.readNext())) break;
  }
}