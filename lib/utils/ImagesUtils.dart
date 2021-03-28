import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/services.dart';

class ImagesUtils {
  static Future<Uint8List> getBytesFromPngAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))
        .buffer
        .asUint8List();
  }
}
