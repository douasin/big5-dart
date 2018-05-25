library big5;

part 'table.dart';

// only non-sream version

const Big5Codec big5 = const Big5Codec();

class Big5Codec {
  const Big5Codec();

  String decode(List<int> src) {
    return Big5Transform(src);
  }
}

// big5 constants.
const int RUNE_ERROR = 0xFFFD;

String Big5Transform(List<int> src) {
  var r = 0;
  var size = 0;
  var s = '';
  var nDst = '';

  var nSrc = 0;

  void write(input) => nDst += (new String.fromCharCode(input));

  for (var nSrc = 0; nSrc < src.length; nSrc += size) {
    var c0 = src[nSrc];
    if (c0 < 0x80) {
      r = c0;
      size = 1;
    } else if (0x81 <= c0 && c0 < 0xFF) {
      if (nSrc + 1 >= src.length) {
        r = RUNE_ERROR;
        size = 1;
        write(r);
        continue;
      }
      var c1 = src[nSrc + 1];
      r = 0xfffd;
      size = 2;

      var i = c0 * 16 * 16 + c1;
      var s = decode()[i];
      if (s != null) {
        write(s);
        continue;
      }
    } else {
      r = RUNE_ERROR;
      size = 1;
    }
    write(r);
    continue;
  }
  return nDst;
}
