import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

/// Service for downloading images with automatic 24-hour cleanup
class ImageDownloaderService {
  ImageDownloaderService._();
  static final ImageDownloaderService instance = ImageDownloaderService._();

  static const String _downloadDirName = 'temp_images';
  static const Duration _cleanupDuration = Duration(hours: 24);

  /// Downloads an image from a remote URL and returns the local file path
  ///
  /// [imageUrl] - The remote URL of the image to download
  /// Returns the local directory path where the image is stored
  Future<String> downloadImage(String imageUrl) async {
    try {
      // Clean up old files first
      await cleanupOldFiles();

      // Get temporary directory
      final tempDir = await getTemporaryDirectory();
      final downloadDir = Directory(path.join(tempDir.path, _downloadDirName));

      // Create download directory if it doesn't exist
      if (!await downloadDir.exists()) {
        await downloadDir.create(recursive: true);
      }

      // Generate unique filename based on URL hash
      final filename = _generateFilename(imageUrl);
      final filePath = path.join(downloadDir.path, filename);

      // Check if file already exists and is recent
      final file = File(filePath);
      if (await file.exists()) {
        final fileAge = DateTime.now().difference(await file.lastModified());
        if (fileAge < _cleanupDuration) {
          print('Image already exists: $filePath');
          return downloadDir.path;
        }
      }

      // Download the image
      print('Downloading image from: $imageUrl');
      final response = await http.get(Uri.parse(imageUrl));

      if (response.statusCode == 200) {
        // Write the image to file
        await file.writeAsBytes(response.bodyBytes);
        print('Image downloaded successfully: $filePath');
        return downloadDir.path;
      } else {
        throw Exception('Failed to download image. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error downloading image: $e');
      rethrow;
    }
  }

  /// Downloads multiple images and returns the directory path
  ///
  /// [imageUrls] - List of remote image URLs
  /// Returns the local directory path where images are stored
  Future<String> downloadMultipleImages(List<String> imageUrls) async {
    try {
      await cleanupOldFiles();

      final tempDir = await getTemporaryDirectory();
      final downloadDir = Directory(path.join(tempDir.path, _downloadDirName));

      if (!await downloadDir.exists()) {
        await downloadDir.create(recursive: true);
      }

      for (final String imageUrl in imageUrls) {
        try {
          await downloadImage(imageUrl);
        } catch (e) {
          print('Error downloading $imageUrl: $e');
          // Continue with other downloads
        }
      }

      return downloadDir.path;
    } catch (e) {
      print('Error downloading multiple images: $e');
      rethrow;
    }
  }

  /// Cleans up files older than 24 hours
  Future<void> cleanupOldFiles() async {
    try {
      final tempDir = await getTemporaryDirectory();
      final downloadDir = Directory(path.join(tempDir.path, _downloadDirName));

      if (!await downloadDir.exists()) {
        return;
      }

      final now = DateTime.now();
      final cutoffTime = now.subtract(_cleanupDuration);

      final files = downloadDir.listSync();
      int deletedCount = 0;

      for (final entity in files) {
        if (entity is File) {
          final lastModified = await entity.lastModified();
          if (lastModified.isBefore(cutoffTime)) {
            await entity.delete();
            deletedCount++;
            print('Deleted old file: ${entity.path}');
          }
        }
      }

      if (deletedCount > 0) {
        print('Cleaned up $deletedCount old file(s)');
      }
    } catch (e) {
      print('Error during cleanup: $e');
    }
  }

  /// Gets the download directory path
  Future<String> getDownloadDirectory() async {
    final tempDir = await getTemporaryDirectory();
    final downloadDir = Directory(path.join(tempDir.path, _downloadDirName));

    if (!await downloadDir.exists()) {
      await downloadDir.create(recursive: true);
    }

    return downloadDir.path;
  }

  /// Lists all downloaded images
  Future<List<File>> listDownloadedImages() async {
    try {
      final tempDir = await getTemporaryDirectory();
      final downloadDir = Directory(path.join(tempDir.path, _downloadDirName));

      if (!await downloadDir.exists()) {
        return [];
      }

      final files = downloadDir
          .listSync()
          .whereType<File>()
          .where((file) => _isImageFile(file.path))
          .toList();

      return files;
    } catch (e) {
      print('Error listing images: $e');
      return [];
    }
  }

  /// Clears all downloaded images
  Future<void> clearAllImages() async {
    try {
      final tempDir = await getTemporaryDirectory();
      final downloadDir = Directory(path.join(tempDir.path, _downloadDirName));

      if (await downloadDir.exists()) {
        await downloadDir.delete(recursive: true);
        print('All images cleared');
      }
    } catch (e) {
      print('Error clearing images: $e');
    }
  }

  /// Generates a unique filename based on URL
  String _generateFilename(String imageUrl) {
    final uri = Uri.parse(imageUrl);
    final urlHash = md5.convert(utf8.encode(imageUrl)).toString();
    final extension = path.extension(uri.path).isNotEmpty ? path.extension(uri.path) : '.jpg';

    return '$urlHash$extension';
  }

  /// Checks if a file is an image based on extension
  bool _isImageFile(String filePath) {
    final extension = path.extension(filePath).toLowerCase();
    return ['.jpg', '.jpeg', '.png', '.gif', '.webp', '.bmp'].contains(extension);
  }
}
