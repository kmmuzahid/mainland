import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/log/app_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonDropDown<T> extends StatefulWidget {
  const CommonDropDown({
    required this.hint,
    required this.items,
    required this.onChanged,
    required this.nameBuilder,
    this.validator,
    this.borderColor,
    this.backgroundColor,
    this.textStyle,
    this.isLoading = false,
    this.borderRadius = 12,
    this.prefix,
    this.enableInitalSelection = true,
    super.key,
  });

  final String hint;
  final List<T> items;
  final Color? borderColor;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Function(T? value) onChanged;
  final String Function(T value) nameBuilder;
  final String? Function(String? value)? validator;
  final bool isLoading;
  final double borderRadius;
  final Widget? prefix;
  final bool enableInitalSelection;

  @override
  State<CommonDropDown<T>> createState() => _CommonDropDownState<T>();
}

class _CommonDropDownState<T> extends State<CommonDropDown<T>> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  T? _selectedItem;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 4))..repeat();

    AppLogger.debug(widget.items.length.toString(), tag: 'common drop down');
    // Set first item by default if items are available
    if (widget.items.isNotEmpty) {
      _selectedItem = widget.items.first;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onChanged(_selectedItem);
      });
    }
  }

  @override
  void didUpdateWidget(covariant CommonDropDown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update selection when new items come in and none selected
    if (_selectedItem == null && widget.items.isNotEmpty) {
      _selectedItem = widget.items.first;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onChanged(_selectedItem);
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = widget.isLoading
        ? AppColors.primaryColor
        : widget.borderColor ?? AppColors.disable;

    return Stack(
      alignment: Alignment.center,
      children: [
        DropdownButtonFormField<T>(
          style: widget.textStyle,

          validator: (value) => (widget.validator == null || value == null)
              ? null
              : widget.validator!(widget.nameBuilder(value)),
          initialValue: widget.enableInitalSelection ? _selectedItem : null,
          decoration: InputDecoration(
            isDense: true,
            filled: widget.backgroundColor != null,
            fillColor: widget.backgroundColor,
            prefixIcon: widget.prefix != null
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: widget.prefix,
                  )
                : null,
            prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
            contentPadding: EdgeInsets.only(left: 10.w, right: 2.w, top: 14.w, bottom: 14.w),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(widget.borderRadius.r)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 1.w),
              borderRadius: BorderRadius.circular(widget.borderRadius.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 1.w),
              borderRadius: BorderRadius.circular(widget.borderRadius.r),
            ),
          ),
          hint: CommonText(
            text: widget.hint,
            style: TextStyle(fontSize: widget.textStyle?.fontSize, color: AppColors.outlineColor),
          ),
          icon: const Icon(Icons.arrow_drop_down),
          dropdownColor: AppColors.serfeceBG,
          isExpanded: true,
          items: widget.items
              .map(
                (item) => DropdownMenuItem<T>(
                  value: item,
                  child: CommonText(text: widget.nameBuilder(item), style: widget.textStyle),
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              _selectedItem = value;
            });
            widget.onChanged(value);
          },
        ),

        // Animated border while loading
        if (widget.isLoading)
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (_, __) {
                return CustomPaint(
                  painter: _BorderLoaderPainter(
                    _controller.value,
                    borderColor,
                    widget.borderRadius,
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}

class _BorderLoaderPainter extends CustomPainter {
  _BorderLoaderPainter(this.progress, this.color, this.borderRadius);
  final double progress; // 0.0 to 1.0
  final Color color;
  final double borderRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final path = Path()..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(borderRadius)));

    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.w
      ..style = PaintingStyle.stroke;

    final dashWidth = 50.0.w;
    final dashSpace = 1.0.w;
    final totalLength = (dashWidth + dashSpace);
    final pathMetrics = path.computeMetrics();

    for (final metric in pathMetrics) {
      double distance = progress * metric.length;

      while (distance < metric.length) {
        final segment = metric.extractPath(distance, distance + dashWidth);
        canvas.drawPath(segment, paint);
        distance += totalLength;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _BorderLoaderPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
