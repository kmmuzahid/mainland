import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/gen/assets.gen.dart';
import 'package:mainland/user/ticketManage/widgets/wallet_button.dart';

@RoutePage()
class TicketSaveScreen extends StatelessWidget {
  const TicketSaveScreen({super.key, required this.ticketId});
  final String ticketId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.ios_share_outlined))],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              width: Utils.deviceSize.width * .6,
              child: CommonText(
                text: '''Juice WRLD  Eko Hotel & Suites Monday, September 6''',
                autoResize: false,
                maxLines: 10,
                textAlign: TextAlign.start,
                alignment: MainAxisAlignment.start,
                fontWeight: FontWeight.w600,
                fontSize: 22,
                textColor: AppColors.primaryColor,
              ),
            ).start,
            CommonText(text: 'Standard', fontSize: 19, textColor: AppColors.greay300).center,
            10.height,
            Container(
              color: AppColors.backgroundWhite,
              padding: EdgeInsets.all(60.w),
              child: CommonImage(imageSrc: Assets.images.sampleQr.path),
            ),
            30.height,
            WalletButton(
              onTap: () {},
              title: 'Apple Wallet',
              image: Assets.images.appleWallet.path,
            ).center,
            8.height,
            WalletButton(
              onTap: () {},
              title: 'Google Wallet',
              image: Assets.images.googleWallet.path,
            ).center,
          ],
        ),
      ),
    );
  }
}
