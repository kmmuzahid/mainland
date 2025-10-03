import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import '../other_widgets/common_loader.dart';
import '../text/common_text.dart';

class CommonButton extends StatefulWidget {
  const CommonButton({
    required this.titleText,
    super.key,
    this.onTap,
    this.titleColor,
    this.buttonColor,
    this.titleSize = 16,
    this.buttonRadius = 8,
    this.alignment = MainAxisAlignment.center,
    this.titleWeight = FontWeight.w600,
    this.buttonHeight = 45,
    this.borderWidth = 1.5,
    this.isLoading = false,
    this.buttonWidth = 80,
    this.borderColor,
    this.icon,
    this.iconWidth,
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
  // Optional explicit icon width to make dynamic width precise when an icon is present
  final double? iconWidth;
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
      text: TextSpan(
        text: widget.titleText,
        // Match CommonText: GoogleFonts.dmSans with scaled size and weight
        style: GoogleFonts.dmSans(
          fontSize: widget.titleSize.sp,
          fontWeight: widget.titleWeight,
          color: widget.titleColor ?? AppColors.onPrimaryColor,
        ),
      ),
      maxLines: 1,
      textDirection: Directionality.of(context),
      textScaler: MediaQuery.textScalerOf(context),
      locale: Localizations.localeOf(context),
    )..layout();

    // Calculate width based on the content width (text or loader),
    // including horizontal padding and icon width + spacing when applicable.
    const double horizontalPadding = 24.0; // from EdgeInsets.symmetric(horizontal: 12.0)
    final double contentWidth = widget.isLoading
        ? (widget.buttonHeight - 12)
              .toDouble() // CommonLoader(size: buttonHeight - 12)
        : textPainter.size.width;
    final bool hasIcon = widget.icon != null;
    final double computedIconWidth = hasIcon
        ? (widget.iconWidth ?? IconTheme.of(context).size ?? 24.0)
        : 0.0;
    final double iconSpacing = hasIcon ? 6.w : 0.0;

    // Border is painted inside the container; include its stroke on both sides
    final double borderStroke = (widget.borderWidth.w * 2);
    double buttonWidth =
        contentWidth + horizontalPadding + computedIconWidth + iconSpacing + borderStroke;
    buttonWidth = buttonWidth < widget.buttonWidth ? widget.buttonWidth : buttonWidth;

    return LayoutBuilder(
      builder: (context, constraints) {
        // Clamp to available width to avoid overflow from tight parents
        final double maxAllowedWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : buttonWidth;
        final double finalWidth = buttonWidth > maxAllowedWidth ? maxAllowedWidth : buttonWidth;

        return Transform.scale(
          scale: scale,
          child: Container(
            width: finalWidth, // Clamped width
            height: widget.buttonHeight.h,
            decoration: BoxDecoration(
              color: widget.buttonColor ?? AppColors.primaryButton,
              borderRadius: BorderRadius.circular(widget.buttonRadius.r),
              border: Border.all(
                color:
                    widget.borderColor ??
                    widget.buttonColor ??
                    Theme.of(context).scaffoldBackgroundColor,
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
                                color: widget.titleColor ?? AppColors.onPrimaryColor,
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
      },
    );
  }
}
