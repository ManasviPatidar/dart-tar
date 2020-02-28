import 'package:dart_tar/dart_tar.dart';

void main() {
  final td = TarDecoder(inputPath: 'posix.tar')..decode();
}
