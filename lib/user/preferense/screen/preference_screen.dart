import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mainland/core/component/mainlad/prefence_category_widget.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/user/preferense/cubit/preference_cubit.dart';
import 'package:mainland/user/preferense/screen/perfence_subcategory_screen.dart';
import 'package:mainland/user/preferense/widgets/preference_header_wideget.dart';

import '../cubit/preference_state.dart';
import '../widgets/preference_actions_widget.dart';

@RoutePage()
class PreferenceScreen extends StatelessWidget {
  const PreferenceScreen({
    this.successRoute,
    super.key,
    this.header,
    this.buttonTitle,
    this.backgroundColor,
    this.onSubscategoryTap,
  });
  final Widget? header;
  final String? buttonTitle;
  final Color? backgroundColor;
  final PageRouteInfo<Object?>? successRoute;
  final Function(String category, String subCategory)?
  onSubscategoryTap; //its dosent allow to mullti select category.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(backgroundColor: backgroundColor),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: BlocProvider<PreferenceCubit>(
          create: (context) => PreferenceCubit(),
          child: BlocBuilder<PreferenceCubit, PreferenceState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    PreferenceHeaderWideget(header: header),
                    SizedBox(height: 20.h),
                    _categoryBuilder(state, context.read<PreferenceCubit>()),
                    if (state.selectedSubcategories.isNotEmpty)
                      PreferenceActionsWidget(
                        buttonTitle: buttonTitle,
                        successRoute: successRoute,
                        category: null,
                        state: state,
                        showAllActions: onSubscategoryTap == null,
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _categoryBuilder(PreferenceState state, PreferenceCubit cubit) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.4,
      ),
      itemCount: state.data.length,
      itemBuilder: (context, index) {
        final category = state.data.keys.elementAt(index);
        return PrefenceCategoryWidget(
          category: category,
          selectedSubcategories:
              onSubscategoryTap !=
                  null //
              ? []
              : ((state.selectedSubcategories[category]) ?? []),
          onTap: () {
            appRouter.push(
              PerfenceSubcategoryRoute(
                buttonTitle: buttonTitle,
                category: category,
                cubit: cubit,
                header: header,
                successRoute: successRoute,
                backgroundColor: AppColors.background,
                onSubscategoryTap: onSubscategoryTap,
              ),
            );
          },
        );
      },
    );
  }
}
