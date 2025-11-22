import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/user/preferense/model/category_model.dart';
import 'package:mainland/user/preferense/model/sub_category_model.dart';

@RoutePage()
class AllSelectedPreferenceScreen extends StatelessWidget {
  const AllSelectedPreferenceScreen({super.key, required this.categoryData});
  final Map<CategoryModel, List<SubCategoryModel>> categoryData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CommonAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: 'Added Preferences',
              fontWeight: FontWeight.bold,
              fontSize: 24,
              textColor: AppColors.primaryColor,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: categoryData.length,
                itemBuilder: (c, index) => _cardBuilder(index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardBuilder(int index) {
    final category = categoryData.entries.elementAt(index);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(text: category.key.title, fontSize: 18, fontWeight: FontWeight.w600),
          ...List.generate(
            category.value.length,
            (index) =>
                CommonText(left: 10, fontSize: 16, text: category.value[index].subcategoryTitle),
          ),
          Utils.divider(),
        ],
      ),
    );
  }
}
