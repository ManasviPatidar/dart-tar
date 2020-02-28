import 'package:dart_tar/dart_tar.dart';

void main() {
  final td = TarDecoder(inputPath: 'gnu.tar')..decode();
}
