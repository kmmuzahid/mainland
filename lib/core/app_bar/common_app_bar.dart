import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    this.title,
    this.onBackPress,
    this.titleWidget,
    this.leading,
    this.actions,
    this.isCenterTitle = true,
    this.backgroundColor,
    this.disableBack = false
  });
  final String? title;
  final Widget? titleWidget;
  final Function()? onBackPress;
  final Widget? leading;
  final List<Widget>? actions;
  final bool isCenterTitle;
  final Color? backgroundColor;
  final bool disableBack;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
    backgroundColor: backgroundColor ?? AppColors.background,
    centerTitle: isCenterTitle,
    actionsPadding: const EdgeInsets.only(bottom: 10),
    leading:
        leading ??
        IconButton(
          onPressed: () {
            if (onBackPress != null) {
              onBackPress!();
            }
            if (!disableBack) {
              appRouter.pop();
            }
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
    actions: actions ?? _appBarActions(),
    title:
        titleWidget ?? CommonText(text: title ?? '', fontWeight: FontWeight.w600, fontSize: 18.sp),
  );

  List<Widget> _appBarActions() => [];
}
