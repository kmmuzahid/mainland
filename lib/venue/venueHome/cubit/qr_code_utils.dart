import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:zxing2/qrcode.dart';

class QrCodeUtils {
  QrCodeUtils._();
  static final instance = QrCodeUtils._();

  Future<String?> decodeQRFromGallery(String path) async {
    try {
      final bytes = await File(path).readAsBytes();
      var image = img.decodeImage(bytes);
      if (image == null) return null;

      // Try multiple preprocessing strategies
      final strategies = [
        image, // Original
        img.grayscale(image), // Grayscale
        img.adjustColor(img.grayscale(image), contrast: 1.5), // High contrast
        img.copyResize(image, width: 512), // Resize smaller
        img.invert(image), // Inverted colors
      ];

      for (var processed in strategies) {
        final result = _tryDecode(processed);
        if (result != null) {
          print('Success with strategy: ${strategies.indexOf(processed)}');
          return result;
        }
      }

      return null;
    } catch (e) {
      print('QR Decode Error: $e');
      return null;
    }
  }

  String? _tryDecode(img.Image image) {
    try {
      final int width = image.width;
      final int height = image.height;
      final pixels = Int32List(width * height);

      // Convert pixels correctly
      for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
          final pixel = image.getPixel(x, y);
          final r = pixel.r.toInt();
          final g = pixel.g.toInt();
          final b = pixel.b.toInt();
          final a = pixel.a.toInt();

          pixels[y * width + x] = (a << 24) | (r << 16) | (g << 8) | b;
        }
      }

      final src = RGBLuminanceSource(width, height, pixels);
      final bitmap = BinaryBitmap(HybridBinarizer(src));
      final result = QRCodeReader().decode(bitmap);

      return result.text;
    } catch (e) {
      return null;
    }
  }
}
