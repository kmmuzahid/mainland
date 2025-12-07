import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/auth/cubit/auth_cubit.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/component/mainlad/event_title_widget.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/venue/venueHome/cubit/venue_cubit.dart';
import 'package:mainland/venue/venueHome/widgets/qr_scanner_box.dart';
import 'package:mainland/venue/venueHome/widgets/venue_app_bar_widget.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:skeletonizer/skeletonizer.dart';

class VenueHomeWidget extends StatelessWidget {
  const VenueHomeWidget({required this.cubit, required this.state, super.key});
  final VenueCubit cubit;
  final VenueState state;

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = context.read<AuthCubit>();
    return SingleChildScrollView(
      child: Column(
        children: [
          10.height,
          VenueAppBarWidget(showLogo: true, title: AppString.scanner),
          GestureDetector(
            onTap: () {
              cubit.pickQrCodeFromGallery(userId: authCubit.state.profileModel?.id ?? '');
            },
            child: Row(
              children: [
                const Spacer(),
                const Icon(Icons.folder_outlined),
                CommonText(text: AppString.browseDevice),
              ],
            ),
          ),
          10.height,
          QrScannerBox(
            isCameraOpen: state.openCamera,
            qrImage: state.openCamera
                ? null
                : (state.image != null
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
                          child: CommonImage(imageSrc: state.image!.path),
                        )
                      : null),
            onTap: cubit.scanQR,
            onDetect: (data) {
              print(data);
            },
          ),

          const SizedBox(height: 10),
          if (state.isEventDetailsLoading)
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
          if (!state.isEventDetailsLoading) ...[
            Row(
              children: [
                CommonText(
                  text: state.eventDetailsModel?.eventCode ?? '',
              fontWeight: FontWeight.bold,
              fontSize: 16,
                ),
                const Spacer(),
                if (state.isQrChecking)
                  SizedBox(height: 20.w, width: 20.w, child: const CircularProgressIndicator()),
              ],
            ),
            EventTitleWidget(title: state.eventDetailsModel?.eventName ?? '').start,
          ],
        ],
      ),
    );
  }
}
