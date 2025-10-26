import 'package:flutter/material.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';

class CommonDateInputTextField extends StatefulWidget {
  const CommonDateInputTextField({
    super.key,
    this.onSave,
    this.prefixIcon,
    this.paddingHorizontal = 16,
    this.paddingVertical = 14,
    this.borderRadius = 10,
    this.onChanged,
    this.suffix,
    this.validation,
    this.borderColor,
    this.backgroundColor,
    this.isReadOnly = false
  });
  final double paddingHorizontal;
  final double paddingVertical;
  final double borderRadius;
  final Function(String date)? onSave;
  final Widget? suffix;
  final Function(String date)? onChanged;
  final String? Function(String? value)? validation;
  final Color? borderColor;
  final Color? backgroundColor;
  final Widget? prefixIcon;
  final bool isReadOnly;

  @override
  State<CommonDateInputTextField> createState() => _CommonDateInputTextFieldState();
}

class _CommonDateInputTextFieldState extends State<CommonDateInputTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  Future<void> _openDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      _controller.text = '${picked.toLocal()}'.split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      isReadOnly: widget.isReadOnly,
      controller: _controller,
      paddingHorizontal: widget.paddingHorizontal,
      paddingVertical: widget.paddingVertical,
      borderRadius: widget.borderRadius,
      onChanged: widget.onChanged,
      hintText: 'YYYY-MM-DD',
      onSaved: (value, _) {
        if (widget.onSave == null) return;
        widget.onSave!(value);
      },
      suffixIcon: GestureDetector(
        onTap: () {
          if (widget.isReadOnly) return;
          _openDatePicker(context);
        },
        child: widget.suffix ?? const Icon(Icons.calendar_month_outlined),
      ),
      validationType: ValidationType.validateDate,
      prefixIcon: widget.prefixIcon,
      validation: widget.validation,
      borderColor: widget.borderColor,
      backgroundColor: widget.backgroundColor,
    );
  }
}
