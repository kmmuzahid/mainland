import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mainland/common/auth/cubit/auth_cubit.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/gen/assets.gen.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Use context safely here
      Utils.deviceSize = MediaQuery.of(context).size;
      context.read<AuthCubit>().init();

      // Optional: Navigate after splash
      
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: Column(
        children: [
          const Spacer(),
          CommonImage(imageSrc: Assets.icon.appIcon.path, width: 208, height: 142).center,
          CommonText(
            text: AppString.appName,
            style: getTheme.textTheme.headlineLarge?.copyWith(color: AppColors.primaryColor),
          ).center,
          CommonText(
            text: AppString.buySellKeepFavoriteTickets,
            style: getTheme.textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
          ).center,
          const Spacer(),
          CommonText(
            text: AppString.copyright,
            style: getTheme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ).center,
          40.height,
        ],
      ),
    );
  }
}
