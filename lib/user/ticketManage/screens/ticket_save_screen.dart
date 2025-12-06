import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/auth/cubit/auth_cubit.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/mainlad/event_title_widget.dart';
import 'package:mainland/core/config/bloc/cubit_scope.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/gen/assets.gen.dart';
import 'package:mainland/user/ticketManage/cubit/ticket_save_cubit.dart';
import 'package:mainland/user/ticketManage/widgets/wallet_button.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

@RoutePage()
class TicketSaveScreen extends StatelessWidget {
  const TicketSaveScreen({super.key, required this.ticketId});
  final String ticketId;

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = context.read();
    return CubitScope(
      create: () =>
          TicketSaveCubit()..fetch(id: ticketId, userId: authCubit.state.profileModel?.id ?? ''),
      builder: (context, cubit, state) => Scaffold(
        appBar: CommonAppBar(
          actions: [
            IconButton(
              onPressed: () {
                cubit.shareNow();
              },
              icon: const Icon(Icons.ios_share_outlined),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: state.isLoding
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: CircularProgressIndicator(),
                  ),
                )
              : Column(
                  children: [
                    EventTitleWidget(title: state.eventDetailsModel?.eventName).start,

                    // CommonText(text: 'Standard', fontSize: 19, textColor: AppColors.greay300).center,
                    10.height,
                    Container(
                      color: AppColors.backgroundWhite,
                      padding: EdgeInsets.all(60.w),
                      child: state.imageByte == null
                          ? SizedBox(height: 170.w, width: 170.w)
                          : Image.memory(state.imageByte!.buffer.asUint8List()),
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
      ),
    );
  }
}
