import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/tickets/model/ticket_model.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart';

class TicketFilterWidget extends StatelessWidget {
  const TicketFilterWidget({
    super.key,
    required this.filters,
    required this.onTap,
    this.selectedFilter,
  });

  final List<TicketFilter> filters;
  final TicketFilter? selectedFilter;
  final Function(TicketFilter) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(26.r),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: List.generate(filters.length, (index) {
              final filter = filters[index];
              final isSelected = filter == selectedFilter;
              return filters.contains(TicketFilter.UnderReview)
                  ? _button(filter, isSelected, constraints.maxWidth)
                  : Expanded(
                      child: _button(filter, isSelected, constraints.maxWidth),
                    );
            }),
          );
        },
      ),
    );
  }

  CommonButton _button(TicketFilter filter, bool isSelected, double maxWidth) {
    double width = (maxWidth - (filters.length * 10 + 10)) / filters.length;

    return CommonButton(
      titleText: filter.displayName,
      buttonRadius: 20,
      buttonHeight: 32,
      borderWidth: 0,
      titleSize: 14,
      buttonWidth: width,
      titleWeight: FontWeight.w400,
      borderColor: isSelected
          ? AppColors.primaryColor
          : AppColors.backgroundWhite,
      onTap: () => onTap(filter),
      buttonColor: isSelected
          ? AppColors.primaryColor
          : AppColors.backgroundWhite,
    );
  }
}
