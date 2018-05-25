import 'package:test/test.dart';

import 'package:big5/big5.dart';

void main() {
  test('decode some bytes of with big5 encoded', () {
    expect(big5.decode([173, 68, 166, 184]), "胖次");
  });
}
