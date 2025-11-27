import 'dart:io';
import 'package:mainland/core/config/api/api_end_point.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class CommonShare {
  CommonShare._();
  static final CommonShare instance = CommonShare._();

  // Future<void> shareContent({
  //   required String title,
  //   required String imageAssetPath,
  //   required String deepLinkUrl, // this will open your app
  // }) async {
  //   try {
  //     // Load image from assets
  //     final byteData = await rootBundle.load(imageAssetPath);

  //     // Save to temporary directory
  //     final tempDir = await getTemporaryDirectory();
  //     final file = File('${tempDir.path}/shared_image.png');
  //     await file.writeAsBytes(byteData.buffer.asUint8List());

  //     // Share text + deep link + image
  //     await Share.shareXFiles([XFile(file.path)], text: '$title\n$deepLinkUrl', subject: title);
  //   } catch (e) {
  //     print("Error sharing: $e");
  //   }
  // }

  Future<void> shareContent({
    required String title,
    required String imageUrl, // <-- URL instead of asset
    required String deepLinkUrl,
  }) async {
    try {
      // Download the image
      final response = await http.get(Uri.parse('${ApiEndPoint.instance.domain}$imageUrl'));
      if (response.statusCode != 200) {
        return;
      }

      // Save to temporary folder
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/shared_image.jpg');
      await file.writeAsBytes(response.bodyBytes);
      final xFile = XFile(file.path);
      final params = ShareParams(
        text: '$title\n$deepLinkUrl',
        files: [xFile],
        title: title,
        previewThumbnail: xFile,
      );
      await SharePlus.instance.share(params);

      file.delete();
    } catch (e) {
      print("Error sharing: $e");
    }
  }

  // flutter_redirectly 2.1.2
}
