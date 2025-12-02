import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/gen/assets.gen.dart';
import 'package:mainland/user/preferense/model/category_model.dart';
import 'package:mainland/user/preferense/model/sub_category_model.dart';

class PrefenceCategoryWidget extends StatelessWidget {
  const PrefenceCategoryWidget({
    super.key,
    required this.category,
    required this.onTap,
    required this.selectedSubcategories,
  });

  final CategoryModel category;
  final Function() onTap;
  final List<SubCategoryModel> selectedSubcategories;

  @override
  Widget build(BuildContext context) { 
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
          border: selectedSubcategories.isNotEmpty
              ? Border.all(width: 1.2.w, color: AppColors.primaryColor)
              : null,
          color: AppColors.primary50,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            CommonImage(size: 74, imageSrc: category.coverImage),
            Text(
              category.title,
              style: AppTextStyles.titleMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
