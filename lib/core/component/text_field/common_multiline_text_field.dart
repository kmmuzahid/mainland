import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:flutter/material.dart';

import 'quill_custom_editor.dart';

class CommonMultilineTextField extends StatefulWidget {
  CommonMultilineTextField({
    required this.validationType,
    super.key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.controller,
    this.textInputAction = TextInputAction.next,
    this.mexLength,
    this.prefixText,
    this.paddingHorizontal = 16,
    this.paddingVertical = 14,
    this.borderRadius = 12,
    this.onSaved,
    this.onChanged,
    this.borderColor,
    this.onTap,
    this.suffixIcon,
    this.isReadOnly = false,
    this.initialText,
    this.showActionButton = false,
    this.actionButtonIcon,
    this.originalPassword,
    this.validation,
    this.backgroundColor,
    this.borderWidth = 1.2,
    this.showValidationMessage = true,
    this.textAlign = TextAlign.left,
    this.enableHtml = false,
    this.height = 100,
    this.maxLenght
  });

  final double borderWidth;
  final Function(String value, TextEditingController controller)? onSaved;
  final Function(String value)? onChanged;
  final String? initialText;
  final bool isReadOnly;
  final String? hintText;
  final String? labelText;
  final String? prefixText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? borderColor;
  final double paddingHorizontal;
  final double paddingVertical;
  final double borderRadius;
  final int? mexLength;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final bool showActionButton;
  final Widget? actionButtonIcon;
  final ValidationType validationType;
  final String Function()? originalPassword;
  final Color? backgroundColor;
  final bool showValidationMessage;
  final TextAlign textAlign;
  final int? maxLenght;
  final bool enableHtml;
  final double height;

  final String? Function(String? value)? validation;

  @override
  State<CommonMultilineTextField> createState() => _CommonMultilineTextFieldState();
}

class _CommonMultilineTextFieldState extends State<CommonMultilineTextField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  late bool _obscureText;

  // bool get _hasController => widget.controller != null;

  @override
  void initState() {
    super.initState();

    _obscureText =
        widget.validationType == ValidationType.validatePassword ||
        widget.validationType == ValidationType.validateConfirmPassword;
    _controller = widget.controller ?? TextEditingController();
    _focusNode = FocusNode();

    // Set initial text only if the controller was provided
    if (widget.initialText != null) {
      _controller.text = widget.initialText ?? '';
    }

    _focusNode.addListener(() {
      setState(() {}); // rebuild to reflect focus changes
    });
  }

  @override
  void dispose() {
    try {
      _focusNode.dispose();
      // if (!_hasController) {
      _controller.dispose();
      // }
    } catch (e) {
      print(e);
    }
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Color _iconColor() {
    return _focusNode.hasFocus ? getTheme.primaryColor : getTheme.colorScheme.outline;
  }

  void _onSave(String? value) {
    if (widget.validationType == ValidationType.validateConfirmPassword)
      assert(
        widget.originalPassword == null,
        'Orginal Password can not be null for Confirm password filed',
      );
    if (widget.onSaved == null) return;
    widget.onSaved!(value?.trim() ?? '', _controller);
  }

  Widget _buildPasswordSuffixIcon() {
    return GestureDetector(
      onTap: _togglePasswordVisibility,
      child: Padding(
        padding: EdgeInsetsDirectional.only(end: 10.w),
        child: Icon(
          _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          size: 20.sp,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // if (enableHtml) {
    //   return CustomQuillField(
    //     height: height,
    //     onSave: onSave,
    //     validator: validationType,
    //     initialText: initialText,
    //     readOnly: readOnly,
    //     hintText: hintText,
    //     borderRadius: borderRadius,
    //     backgroundColor: backgroundColor,
    //     borderColor: borderColor,
    //     borderWidth: borderWidth,
    //   );
    // }
    return SizedBox(
      height: widget.height,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.top,
        readOnly: widget.isReadOnly,
        maxLines: null,
        scrollPhysics: const BouncingScrollPhysics(),
        inputFormatters: [
          ...InputHelper.getInputFormatters(widget.validationType),
          if (widget.maxLenght != null) LengthLimitingTextInputFormatter(widget.maxLenght),
        ],
        keyboardType: InputHelper.getKeyboardType(widget.validationType),
        textAlign: widget.textAlign,
        controller: _controller,
        focusNode: _focusNode,
        enableInteractiveSelection: !widget.isReadOnly,
        obscureText: _obscureText,
        onChanged: widget.onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textInputAction: widget.textInputAction,
        onSaved: _onSave,
        maxLength: widget.mexLength,
        onFieldSubmitted: _onSave,
        onTap: widget.onTap,
        validator:
            widget.validation ??
            (value) {
              final error = InputHelper.validate(
                widget.validationType,
                value,
                originalPassword: widget.originalPassword?.call(),
              );
              // Return the error to show the error border, but return null for the message if showValidationMessage is false
              return widget.showValidationMessage ? error : (error != null ? '' : null);
            },

        style: getTheme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 16.sp),
       
        expands: true, // expands to fill parent height
        decoration: InputDecoration(
          filled: true,
          counterText: '',

          errorMaxLines: 1,
          errorStyle: const TextStyle(fontSize: 0, height: 0),
          fillColor: widget.backgroundColor,
          hintStyle: TextStyle(fontSize: 16.sp, color: AppColors.outlineColor),
          prefixIcon: widget.prefixText?.isNotEmpty == true
              ? Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 5,
                  ), // add some right padding to allow hint space
                  child: CommonText(text: widget.prefixText!, textColor: _iconColor()),
                )
              : Padding(
                  padding: EdgeInsets.only(left: 10.w, right: widget.paddingHorizontal),
                  child: widget.prefixIcon,
                ),
          suffixIconConstraints: BoxConstraints(
            maxWidth:
                widget.suffixIcon == null &&
                    widget.validationType != ValidationType.validatePassword
                ? widget.paddingHorizontal
                : double.infinity,
          ),

          prefixIconConstraints: BoxConstraints(
            maxWidth: widget.prefixIcon == null ? widget.paddingHorizontal : double.infinity,
          ),
          suffixIcon: widget.showActionButton
              ? GestureDetector(
                  onTap: () {
                    _onSave(_controller.text.trim());
                  },
                  child: widget.actionButtonIcon ?? const Icon(Icons.search),
                )
              : widget.validationType == ValidationType.validatePassword
              ? (_obscureText ? _buildPasswordSuffixIcon() : _buildPasswordSuffixIcon())
              : Padding(
                  padding: EdgeInsets.only(right: 10, left: widget.paddingHorizontal),
                  child: widget.suffixIcon,
                ),
          prefixIconColor: _iconColor(),
          suffixIconColor: _iconColor(),

          focusedBorder: OutlineInputBorder(
            borderSide: getTheme.inputDecorationTheme.focusedBorder!.borderSide.copyWith(
              color: widget.isReadOnly
                  ? (widget.borderColor ?? getTheme.dividerColor)
                  : getTheme.primaryColor,
              width: widget.borderWidth.w,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius.r),
          ),

          errorBorder: OutlineInputBorder(
            borderSide: getTheme.inputDecorationTheme.errorBorder!.borderSide.copyWith(
              color: AppColors.error,
              width: widget.borderWidth.w,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: getTheme.inputDecorationTheme.enabledBorder!.borderSide.copyWith(
              color: widget.borderColor ?? getTheme.dividerColor,
              width: widget.borderWidth.w,
            ),

            borderRadius: BorderRadius.circular(widget.borderRadius.r),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: widget.paddingHorizontal.w,
            vertical: widget.paddingVertical.h,
          ),
          hintText: widget.hintText,
          labelText: widget.labelText,
        )
      ),
    );
  }
}
