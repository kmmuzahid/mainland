import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/user/preferense/cubit/preference_state.dart';

class PreferenceActionsWidget extends StatelessWidget {
  const PreferenceActionsWidget({
    super.key,
    required this.buttonTitle,
    required this.successRoute,
    required this.category,
    required this.state,
    this.showAllActions = false,
  });

  final String? buttonTitle;
  final PageRouteInfo<Object?>? successRoute;
  final String? category;
  final PreferenceState state;
  final bool showAllActions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, bottom: 40.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showAllActions && category != null)
            CommonButton(buttonWidth: 230, titleText: 'Add More Preference', onTap: appRouter.pop),
          if (showAllActions) ...[
            10.height,
            CommonButton(
              buttonWidth: 230,
              titleText: 'See Selected Preferences',
              onTap: () {
                appRouter.push(
                  AllSelectedPreferenceRoute(categoryData: state.selectedSubcategories),
                );
              },
            ),
            10.height,
            CommonButton(
              buttonWidth: 230,
              titleText: buttonTitle ?? 'Next',
              onTap: () {
                if (successRoute != null) {
                  appRouter.replaceAll([successRoute!]);
                } else {
                  appRouter.pop();
                  appRouter.pop(MapEntry(category, state.selectedSubcategories[category] ?? []));
                }
              },
            ),
          ],
        ],
      ),
    );
  }
}
