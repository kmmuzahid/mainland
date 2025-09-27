import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../other_widgets/common_loader.dart';
import '../text/common_text.dart';

class CommonButton extends StatefulWidget {
  const CommonButton({
    required this.titleText,
    super.key,
    this.onTap,
    this.titleColor,
    this.buttonColor,
    this.titleSize = 12,
    this.buttonRadius = 8,
    this.alignment = MainAxisAlignment.center,
    this.titleWeight = FontWeight.w700,
    this.buttonHeight = 40,
    this.borderWidth = 1.5,
    this.isLoading = false,
    this.buttonWidth = double.infinity,
    this.borderColor,
    this.icon,
  });
  final VoidCallback? onTap;
  final String titleText;
  final Color? titleColor;
  final Color? buttonColor;
  final Color? borderColor;
  final double borderWidth;
  final double titleSize;
  final FontWeight titleWeight;
  final double buttonRadius;
  final double buttonHeight;
  final double buttonWidth;
  final bool isLoading;
  final Widget? icon;
  final MainAxisAlignment alignment;

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 80),
      upperBound: 0.05,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scale = 1 - _animationController.value;

    // Measure the title text to dynamically adjust width
    final textPainter = TextPainter(
      text: TextSpan(text: widget.titleText, style: TextStyle(fontSize: (widget.titleSize + 5))),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    // Calculate width based on the text width, but ensure it does not go below the minimum width
    double buttonWidth =
        textPainter.size.width + (widget.icon != null ? 40.w : 24.w); // Adjust width based on icon and padding
    buttonWidth = buttonWidth < widget.buttonWidth ? widget.buttonWidth : buttonWidth;

    return Transform.scale(
      scale: scale,
      child: Container(
        width: buttonWidth, // Dynamically calculated width
        height: widget.buttonHeight.h,
        decoration: BoxDecoration(
          color: widget.buttonColor ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(widget.buttonRadius.r),
          border: Border.all(
            color: widget.borderColor ?? widget.buttonColor ?? Theme.of(context).scaffoldBackgroundColor,
            width: widget.borderWidth.w,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          type: MaterialType.transparency,
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(widget.buttonRadius.r),
            onTapDown: (_) => _animationController.forward(),
            onTapUp: (_) => _animationController.reverse(),
            onTapCancel: () => _animationController.reverse(),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                child: Row(
                  mainAxisAlignment: widget.alignment,
                  children: [
                    if (widget.icon != null) ...[widget.icon!, SizedBox(width: 6.w)],
                    widget.isLoading
                        ? CommonLoader(size: widget.buttonHeight - 12)
                        : CommonText(
                          text: widget.titleText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          fontSize: widget.titleSize.sp,
                          color: widget.titleColor ?? Theme.of(context).colorScheme.onSecondary,
                          fontWeight: widget.titleWeight,
                        ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
