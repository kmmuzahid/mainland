import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/component/mainlad/event_title_widget.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/venue/venueHome/cubit/venue_cubit.dart';
import 'package:mainland/venue/venueHome/widgets/venue_app_bar_widget.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:skeletonizer/skeletonizer.dart';

class VenueHomeWidget extends StatelessWidget {
  const VenueHomeWidget({required this.venueCubit, required this.venueState, super.key});
  final VenueCubit venueCubit;
  final VenueState venueState;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          10.height,
          VenueAppBarWidget(showLogo: true, title: AppString.scanner),
          GestureDetector(
            onTap: venueCubit.pickQrCodeFromGallery,
            child: Row(
              children: [
                const Spacer(),
                const Icon(Icons.folder_outlined),
                CommonText(text: AppString.browseDevice),
              ],
            ),
          ),

          Offstage(
            offstage: venueState.image != null,
            child: SizedBox(
                    height: Utils.deviceSize.height * .5,
                    width: double.infinity,
                    child: MobileScanner(
                      controller: venueCubit.scannerController,
                      onDetect: (capture) {
                        final barcode = capture.barcodes.first;
                         
                      },
                    ),
            ),
          ),

          GestureDetector(
            onTap: venueCubit.scanQR,
            child: venueState.image != null
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.w),
                    child: CommonImage(imageSrc: venueState.image!.path),
                  )
                : const SizedBox.shrink(),
          ),
          const SizedBox(height: 10),
          if (venueState.isEventDetailsLoading)
            SizedBox(
              height: 100.w,
              child: Skeleton.leaf(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
            ),
          if (!venueState.isEventDetailsLoading) ...[
            CommonText(
              text: venueState.eventDetailsModel?.eventCode ?? '',
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ).start,
            EventTitleWidget(title: venueState.eventDetailsModel?.eventName ?? '').start,
          ]
        ],
      ),
    );
  }
}
