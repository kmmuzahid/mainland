import 'package:flutter/material.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScannerBox extends StatelessWidget {
  const QrScannerBox({
    required this.isCameraOpen,
    required this.onTap,
    required this.onDetect,
    super.key,
    this.qrImage,
  });
  final bool isCameraOpen;
  final Widget? qrImage;
  final VoidCallback onTap;
  final ValueChanged<String> onDetect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Utils.deviceSize.width - 100,
        height: Utils.deviceSize.width - 100,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: qrImage != null ? Colors.white : null,
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(12),
        ),

        child: (qrImage != null && !isCameraOpen)
            ? qrImage
            : isCameraOpen
            ? _Scanner(onDetect: onDetect)
            : const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.qr_code_scanner, size: 45),
                    SizedBox(height: 6),
                    CommonText(text: 'Tap to Scan', fontSize: 16),
                  ],
                ),
              ),
      ),
    );
  }
}

class _Scanner extends StatefulWidget {
  final ValueChanged<String> onDetect;
  const _Scanner({required this.onDetect});

  @override
  State<_Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<_Scanner> {
  final MobileScannerController _controller = MobileScannerController();
  bool locked = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _scan(BarcodeCapture cap) {
    if (locked) return;
    final code = cap.barcodes.first.rawValue;
    if (code == null || code.isEmpty) return;

    locked = true;
    widget.onDetect(code);
  }

  @override
  Widget build(BuildContext context) {
    return MobileScanner(controller: _controller, onDetect: _scan);
  }
}
