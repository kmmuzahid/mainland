import 'package:flutter/material.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../text/common_text.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField({
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
  });

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
  
  final String? Function(String? value)? validation;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
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
    return _focusNode.hasFocus
        ? getTheme.primaryColor
        : getTheme.colorScheme.outline;
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

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: TextFormField(
        controller: _controller,
        focusNode: _focusNode,
        obscureText: _obscureText,
        readOnly: widget.isReadOnly,
        onChanged: widget.onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: InputHelper.getKeyboardType(widget.validationType),
        textInputAction: widget.textInputAction,
        onSaved: _onSave,
        maxLength: widget.mexLength,
        inputFormatters: InputHelper.getInputFormatters(widget.validationType),
        onFieldSubmitted: _onSave,
        onTap: widget.onTap,
        validator:
            widget.validation ??
            (value) => InputHelper.validate(
          widget.validationType,
          value,
              originalPassword: widget.originalPassword?.call(),
        ),

        style: getTheme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 16.sp),
        decoration: InputDecoration(
          filled: true,
          counterText: '',
          errorMaxLines: 2,
          fillColor: widget.backgroundColor,
          hintStyle: TextStyle(fontSize: 16.sp),
          prefixIcon: widget.prefixText?.isNotEmpty == true
              ? Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 5,
                  ), // add some right padding to allow hint space
                  child: CommonText(text: widget.prefixText!, color: _iconColor()),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: widget.prefixIcon,
                ),
          prefixIconConstraints: const BoxConstraints(maxWidth: 40),
          suffixIcon: widget.showActionButton
              ? GestureDetector(
                  onTap: () {
                    _onSave(_controller.text.trim());
                  },
                  child: widget.actionButtonIcon ?? const Icon(Icons.search),
                )
              : widget.validationType == ValidationType.validatePassword
              ? (_obscureText 
              ? _buildPasswordSuffixIcon()
              : _buildPasswordSuffixIcon())
              : widget.suffixIcon,
          prefixIconColor: _iconColor(),
          suffixIconColor: _iconColor(),

          enabledBorder: widget.borderColor != null
              ? getTheme.inputDecorationTheme.enabledBorder?.copyWith(
                  borderSide:
                      getTheme.inputDecorationTheme.enabledBorder?.borderSide.copyWith(
                        color: widget.borderColor,
                      ) ??
                      BorderSide(color: widget.borderColor!),
                )
              : getTheme.inputDecorationTheme.enabledBorder,
          contentPadding: EdgeInsets.symmetric(
            horizontal: widget.paddingHorizontal.w,
            vertical: widget.paddingVertical.h,
          ),
          hintText: widget.hintText,
          labelText: widget.labelText,
        ),
      ),
    );
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
}
