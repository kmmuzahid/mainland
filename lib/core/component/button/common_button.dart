import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
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
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.linear));

    if (widget.isLoading) {
      _animationController.repeat();
    }
  }

  @override
  void didUpdateWidget(CommonButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isLoading != oldWidget.isLoading) {
      if (widget.isLoading) {
        _animationController.repeat();
      } else {
        _animationController.stop();
        _animationController.reset();
      }
    }
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
        
        style: getTheme.textTheme.bodyMedium?.copyWith(
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
    final double horizontalPadding = 24.0.w; // from EdgeInsets.symmetric(horizontal: 12.0)
    final double contentWidth = widget.isLoading
        ? textPainter
              .size
              .width // Keep text width for layout consistency
        : textPainter.size.width;
    final bool hasIcon = widget.icon != null;
    final double computedIconWidth = hasIcon
        ? (widget.iconWidth?.w ?? IconTheme.of(context).size ?? 24.0.w)
        : 0.0;
    final double iconSpacing = hasIcon ? 6.w : 0.0;

    // Border is painted inside the container; include its stroke on both sides
    final double borderStroke = (widget.borderWidth.w * 2);
    double buttonWidth =
        contentWidth + horizontalPadding + computedIconWidth + iconSpacing + borderStroke + 5.w;
    buttonWidth = buttonWidth < widget.buttonWidth.w ? widget.buttonWidth.w : buttonWidth;

    return LayoutBuilder(
      builder: (context, constraints) {
        // Clamp to available width to avoid overflow from tight parents
        final double maxAllowedWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : buttonWidth;
        final double finalWidth = buttonWidth > maxAllowedWidth ? maxAllowedWidth : buttonWidth;

        return Transform.scale(
          scale: scale,
          child: Stack(
            children: [
              Container(
                width: finalWidth + 3.w, // Clamped width
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
                        padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 6.0.h),
                        child: Row(
                          mainAxisAlignment: widget.alignment,
                          children: [
                            if (widget.icon != null) ...[widget.icon!, SizedBox(width: 6.w)],
                            CommonText(
                              text: widget.titleText,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              fontSize: widget.titleSize.sp,
                              textColor: widget.titleColor ?? AppColors.onPrimaryColor,
                              fontWeight: widget.titleWeight,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Animated border line
              if (widget.isLoading)
                Positioned.fill(
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return CustomPaint(
                        painter: _BorderLinePainter(
                          progress: _animation.value,
                          borderColor: widget.titleColor ?? AppColors.onPrimaryColor,
                          borderRadius: widget.buttonRadius.r,
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _BorderLinePainter extends CustomPainter {
  final double progress;
  final Color borderColor;
  final double borderRadius;

  _BorderLinePainter({
    required this.progress,
    required this.borderColor,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    );

    // Calculate the total perimeter
    final perimeter = 2 * (size.width + size.height);

    // Calculate the current position based on progress (0.0 to 1.0)
    final currentDistance = progress * perimeter;

    // Main moving dot with glow effect
    final glowPaint = Paint()
      ..color = borderColor.withOpacity(0.2)
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8.0);

    final dotPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.fill;

    final highlightPaint = Paint()
      ..color = borderColor.withOpacity(0.8)
      ..style = PaintingStyle.fill;

    // Get the current position on the perimeter
    final currentPoint = _getPointOnRect(rect, currentDistance, perimeter);

    // Draw trailing dots for motion effect
    _drawTrailingDots(canvas, rect, currentDistance, perimeter);

    // Draw glow layer (largest, most transparent)
    canvas.drawCircle(currentPoint, 12.0, glowPaint);

    // Draw main dot
    canvas.drawCircle(currentPoint, 4.0, dotPaint);

    // Draw highlight (small, bright center)
    canvas.drawCircle(currentPoint, 1.5, highlightPaint);
  }

  void _drawTrailingDots(Canvas canvas, RRect rect, double currentDistance, double perimeter) {
    final trailPaint = Paint()..style = PaintingStyle.fill;

    // Draw 5 trailing dots with decreasing opacity and size
    for (int i = 1; i <= 5; i++) {
      final trailDistance = (currentDistance - (i * 8) + perimeter) % perimeter;
      final trailPoint = _getPointOnRect(rect, trailDistance, perimeter);
      final opacity = (0.3 / i).clamp(0.0, 0.3); // Decreasing opacity
      final size = (3.0 - (i * 0.4)).clamp(0.8, 3.0); // Decreasing size

      trailPaint.color = borderColor.withOpacity(opacity);
      canvas.drawCircle(trailPoint, size, trailPaint);
    }
  }

  Offset _getPointOnRect(RRect rect, double distance, double perimeter) {
    final width = rect.width;
    final height = rect.height;

    // Normalize distance to [0, perimeter)
    distance = distance % perimeter;

    if (distance < width) {
      // Top edge (left to right)
      return Offset(rect.left + distance, rect.top);
    } else if (distance < width + height) {
      // Right edge (top to bottom)
      return Offset(rect.right, rect.top + (distance - width));
    } else if (distance < 2 * width + height) {
      // Bottom edge (right to left)
      return Offset(rect.right - (distance - width - height), rect.bottom);
    } else {
      // Left edge (bottom to top)
      return Offset(rect.left, rect.bottom - (distance - 2 * width - height));
    }
  }

  @override
  bool shouldRepaint(_BorderLinePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
