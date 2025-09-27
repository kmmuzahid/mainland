// File: setting_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';

@RoutePage()
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CommonAppBar(title: AppString.account),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsGeometry.only(left: 16, right: 16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: BoxBorder.all(width: 8, color: AppColors.secondaryColor),
                shape: BoxShape.circle,
              ),
              //   child: const CommonImage(
              //     imageSrc: AppImages.homeBanner,
              //     borderRadius: 130,
              //     width: 130,
              //     height: 130,
              //   ).center,
              // ),
              // 10.height,
              // Text('Cameron Williamson', style: getTheme.textTheme.bodyLarge),
              // 4.height,
              // const Text(
              //   '+123456789',
              //   style: TextStyle(
              //     color: AppColors.secondaryText,
              //     fontSize: 16,
              //     fontWeight: FontWeight.w700,
              //   ),
              // ),
              // 10.height,

              // _buildMenu(
              //   leading: const Icon(Icons.person_outline),
              //   title: AppString.changePersonalInfo,
              //   onTap: () {
              //     appRouter.push(const ProfileInfoRoute());
              //   },
              // ),

              // _buildMenu(
              //   image: AppImages.drawerLanguage,
              //   title: AppString.drawerLanguage,
              //   onTap: () => appRouter.push(const LanguageRoute()),
              // ),

              // _buildMenu(
              //   leading: const Icon(Icons.privacy_tip_outlined),
              //   title: AppString.privacyPolicy,
              //   onTap: () => appRouter.push(const PrivacyPolicyRoute()),
              // ),

              // _buildMenu(
              //   leading: const Icon(Icons.library_books_outlined),
              //   title: AppString.termsCondition,
              //   onTap: () => appRouter.push(const TermsConditionRoute()),
              // ),

              // _buildMenu(
              //   image: AppImages.drawerDeleteAccount,
              //   title: AppString.drawerDeleteAccount,
              //   onTap: () {
              //     DeleteAccountAlert();
              //   },
              // ),

              // const SizedBox(height: 50),
              // _buildMenu(
              //   image: AppImages.drawerLogout,
              //   enableTrailing: false,
              //   title: AppString.logOut,
              //   onTap: () {
              //     final authCbut = context.read<AuthCubit>();
              //     CommonAlert(
              //       title: AppString.logoutMessage,
              //       onTap: () {
              //         authCbut.logout();
              //       },
              //     );
              //   },
            ),
          ],
        ),
      ),
    ),
  );

  ListTile _buildMenu({
    required String title,
    required Function() onTap,
    String? image,
    Widget? leading,
    bool enableTrailing = true,
  }) {
    return ListTile(
      leading: leading ?? CommonImage(imageSrc: image!, size: 24),
      trailing: enableTrailing ? const Icon(Icons.arrow_forward_ios) : null,
      title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
      onTap: () {
        onTap();
        // Handle logout logic
      },
    );
  }
}
