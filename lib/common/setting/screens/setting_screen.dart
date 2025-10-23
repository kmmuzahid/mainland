// File: setting_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/auth/cubit/auth_cubit.dart';
import 'package:mainland/common/auth/model/user_login_info_model.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/component/other_widgets/common_dialog.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/gen/assets.gen.dart';
import 'package:mainland/main.dart';

@RoutePage()
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key, this.showBackButton = false});
  final bool showBackButton;
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: [
          showBackButton ? const CommonAppBar() : 10.height,

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CommonText(
                    text: AppString.myAccount,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    style: AppTextStyles.titleMedium?.copyWith(color: AppColors.primaryColor),
                  ).start,
                  8.height,
                  GestureDetector(
                    onTap: () {
                      commonDialog(
                        isDismissible: true,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            24.height,
                            CommonImage(imageSrc: Assets.images.user.path, size: 63),
                            22.height,
                            CommonButton(
                              buttonWidth: 150.w,
                              titleText: AppString.uploadImage,
                              onTap: () {},
                            ),
                            8.height,
                            CommonButton(
                              buttonWidth: 150.w,
                              titleText: AppString.removeImage,
                              onTap: () {},
                            ),
                            14.height,
                            CommonButton(
                              titleText: AppString.cancel,
                              borderColor: AppColors.error,
                              titleColor: AppColors.error,
                              onTap: appRouter.pop,
                              buttonColor: AppColors.backgroundWhite,
                            ),
                            24.height,
                          ],
                        ),
                        context: context,
                      );
                    },
                    child: CommonImage(imageSrc: Assets.images.user.path, size: 36).start,
                  ),
                  CommonText(
                    top: 8,
                    text: context.read<AuthCubit>().state.userLoginInfoModel.name,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ).start,
                  10.height,
                  accountSummery(),
                  15.height,
                  if (Utils.getRole() == Role.ORGANIZER) ...[
                    _menuItems(title: AppString.sendNotificationAboutAnEvent, onTap: () {}),
                    Divider(color: AppColors.greay100),
                  ],

                  _menuItems(
                    title: AppString.aboutUs,
                    onTap: () {
                      appRouter.push(ShowInfoRoute(title: AppString.aboutUs, content: 'About Us'));
                    },
                  ),
                  Divider(color: AppColors.greay100),
                  _menuItems(
                    title: AppString.faqHelp,
                    onTap: () {
                      appRouter.push(ShowInfoRoute(title: AppString.faqHelp, content: 'FAQ/Help'));
                    },
                  ),
                  Divider(color: AppColors.greay100),
                  _menuItems(
                    title: AppString.contactUs,
                    onTap: () {
                      appRouter.push(const ContactUsRoute());
                    },
                  ),
                  Divider(color: AppColors.greay100),
                  _menuItems(title: AppString.linkYourBankAccount, onTap: () {}),
                  Divider(color: AppColors.greay100),
                  _menuItems(
                    title: AppString.emailPreferences,
                    onTap: () {
                      appRouter.push(const EmailPreferenceRoute());
                    },
                  ),
                  Divider(color: AppColors.greay100),
                  _menuItems(
                    title: AppString.changePassword,
                    onTap: () {
                      appRouter.push(const ChangePasswordRoute());
                    },
                  ),
                  Divider(color: AppColors.greay100),
                  _menuItems(
                    title: AppString.deleteAccount,
                    onTap: () {
                      CommonDialogWithActions(
                        title: AppString.deleteAccount,
                        subTitle: AppString.areYouSureYouWantToDeleteYourAccount,
                        content: [
                          CommonTextField(
                            validationType: ValidationType.validatePassword,
                            hintText: AppString.password,
                          ),
                        ],
                        onConfirm: () {},
                        context: context,
                      );
                    },
                  ),
                  Divider(color: AppColors.greay100),
                  _menuItems(title: AppString.locations, subTitle: 'Lagos, Nigeria', onTap: () {}),
                  20.height,
                  CommonButton(
                    titleText: AppString.logOut,
                    onTap: () {
                      context.read<AuthCubit>().logout();
                    },
                  ).center,
                  10.height,
                  CommonText(
                    text: '${AppString.appName} v $versionCode',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ).center,

                  CommonText(
                    text: AppString.copyright,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ).center,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          appRouter.push(const TermsConditionRoute());
                        },
                        child: CommonText(
                          text: AppString.termsOfuse,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.primaryColor,
                        ),
                      ),
                      const CommonText(text: ' & ', fontSize: 12, fontWeight: FontWeight.w400),
                      GestureDetector(
                        onTap: () {
                          appRouter.push(const PrivacyPolicyRoute());
                        },
                        child: CommonText(
                          text: AppString.privacyNotice,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  30.height,
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget _menuItems({required String title, required Function() onTap, String? subTitle}) {
    Widget textWidget = CommonText(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      text: title.capitalizeEachWord(),
    );
    if (subTitle != null) {
      textWidget = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonText(fontSize: 14, fontWeight: FontWeight.w400, text: title.capitalizeEachWord()),
          CommonText(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            textColor: AppColors.primaryColor,
            text: subTitle,
          ),
        ],
      );
    }
    final Widget container = Container(
      height: 54.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.white400,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          textWidget,
          const Spacer(),
          Icon(Icons.arrow_forward_ios, color: AppColors.primaryColor),
        ],
      ),
    );
    return GestureDetector(onTap: onTap, child: container);
  }

  Widget accountSummery() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.accountBanner.path),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              12.height,
              CommonText(
                text: AppString.myBalance,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                textAlign: TextAlign.left,
                textColor: AppColors.textWhite,
              ).start,
              CommonText(
                text: '\$625',
                fontWeight: FontWeight.w600,
                fontSize: 24,
                textAlign: TextAlign.left,
                textColor: AppColors.textWhite,
              ).start,
              12.height,
            ],
          ),
          const Spacer(),
          CommonButton(
            buttonColor: AppColors.backgroundWhite,
            titleText: AppString.withdraw,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

