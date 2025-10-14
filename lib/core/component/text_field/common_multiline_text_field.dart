import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:flutter/material.dart';

class CommonMultilineTextField extends StatelessWidget {
  const CommonMultilineTextField({
    required this.height,
    required this.onSave,
    required this.validationType,
    super.key,
    this.initialText,
    this.readOnly = false,
    this.hintText,
    this.borderRadius = 18,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 1.2
  });

  final double height;
  final Function(String p1) onSave;
  final ValidationType validationType;
  final String? initialText;
  final bool readOnly;
  final String? hintText;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderWidth;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        initialValue: initialText,

        onSaved: (newValue) {
          if (newValue != null && newValue.isNotEmpty) {
            onSave(newValue);
          }
        },
        readOnly: readOnly,
        maxLines: null,
        style: getTheme.textTheme.bodyMedium,
        scrollPhysics: const BouncingScrollPhysics(),
        validator: (value) => InputHelper.validate(validationType, value),
        inputFormatters: InputHelper.getInputFormatters(validationType),
        keyboardType: InputHelper.getKeyboardType(validationType),
        expands: true, // expands to fill parent height
        decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderSide: getTheme.inputDecorationTheme.focusedBorder!.borderSide.copyWith(
              color: getTheme.primaryColor,
              width: borderWidth.w,
            ),
            borderRadius: BorderRadius.circular(borderRadius.r),
          ),

          errorBorder: OutlineInputBorder(
            borderSide: getTheme.inputDecorationTheme.errorBorder!.borderSide.copyWith(
              color: AppColors.error,
              width: borderWidth.w,
            ),
            borderRadius: BorderRadius.circular(borderRadius.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: getTheme.inputDecorationTheme.enabledBorder!.borderSide.copyWith(
              color: borderColor ?? getTheme.dividerColor,
              width: borderWidth.w,
            ),
            
            borderRadius: BorderRadius.circular(borderRadius.r),
          ),
          contentPadding: const EdgeInsets.all(12),
          filled: true,
          fillColor: backgroundColor,
        ),
      ),
    );
  }
}
