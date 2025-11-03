import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:flutter_auto_size_text/flutter_auto_size_text.dart';

class CommonText extends StatelessWidget {
  const CommonText({
    required this.text,
    super.key,
    this.maxLines,
    this.textAlign = TextAlign.center,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.style,
    this.overflow,
    this.enableBorder = false,
    this.borderColor,
    this.borderRadious,
    this.backgroundColor,
    this.alignment,
    this.borderRadiusOnly,
    this.suffix,
    this.preffix,
    this.isDescription = false,
    this.textHeight,
    this.autoResize = true,
    this.minFontSize = 10,
    this.maxAutoFontSize,
    this.stepGranularity = 0.5,
    this.softWrap,
    this.decorationColor,
    this.decoration,
    this.textDirection,
    this.height,
    this.textScaleFactor = .9,
  });

  final double left;
  final double right;
  final double top;
  final double bottom;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final String text;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextStyle? style;
  final bool? enableBorder;
  final Color? borderColor;
  final double? borderRadious;
  final BorderRadius? borderRadiusOnly;
  final Color? backgroundColor;
  final MainAxisAlignment? alignment;
  final Widget? suffix;
  final Widget? preffix;
  final bool isDescription;
  final double? textHeight;
  final bool autoResize;
  final double minFontSize;
  final double? maxAutoFontSize;
  final double stepGranularity;
  final bool? softWrap;
  final Color? decorationColor;
  final TextDecoration? decoration;
  final TextDirection? textDirection;
  final double? height;
  final double textScaleFactor;

  @override
  Widget build(BuildContext context) {
    return enableBorder == true || backgroundColor != null
        ? _withBorder(context)
        : _withoutBorder(context);
  }

  EdgeInsets _edgeInsetsBuilder() =>
      EdgeInsets.only(left: left.w, right: right.w, top: top.h, bottom: bottom.h);

  Widget _withBorder(BuildContext context) => Container(
    padding: _edgeInsetsBuilder(),
    margin: EdgeInsets.all(5.w),
    decoration: BoxDecoration(
      color: backgroundColor ?? getTheme.scaffoldBackgroundColor,
      border: Border.all(color: borderColor ?? Theme.of(context).dividerColor, width: 1.2.w),
      borderRadius: BorderRadius.circular(borderRadious?.r ?? 4.r),
    ),
    child: _textField(context),
  );

  Widget _withoutBorder(BuildContext context) =>
      Padding(padding: _edgeInsetsBuilder(), child: _textField(context));

  WrapAlignment _convertAlignment() {
    switch (alignment) {
      case MainAxisAlignment.center:
        return WrapAlignment.center;
      case MainAxisAlignment.end:
        return WrapAlignment.end;
      case MainAxisAlignment.start:
      default:
        return WrapAlignment.start;
    }
  }

  Widget _textField(BuildContext context) {
    // Start with the provided style or create a new one
    final baseTextStyle = (style ?? const TextStyle()).copyWith(
      fontSize: fontSize?.sp,
      color: textColor,
      fontWeight: fontWeight,
      height: height,
      decoration: decoration,
      decorationColor: decorationColor,
      fontFamily: style?.fontFamily ?? 'Selawik',
    );

    // If no style was provided, merge with theme's text style
    final effectiveTextStyle = style != null
        ? baseTextStyle
        : Theme.of(context).textTheme.bodyMedium?.merge(baseTextStyle) ?? baseTextStyle;

    // Calculate min/max font sizes for auto-resize
    final double step = stepGranularity > 0 ? stepGranularity : 1.0;
    final double baseMin = minFontSize > 0 ? minFontSize : 8.0; // Ensure minimum font size
    final double baseMax = (maxAutoFontSize ?? fontSize ?? baseTextStyle.fontSize ?? 16);

    // Helper functions for quantizing font sizes
    double qFloor(double value, double step) {
      final n = (value / step).floor();
      return double.parse((n * step).toStringAsFixed(2));
    }

    double qCeil(double value, double step) {
      final n = (value / step).ceil();
      return double.parse((n * step).toStringAsFixed(2));
    }

    final double adjustedMin = qFloor(baseMin, step);
    double adjustedMax = qCeil(baseMax, step);
    if (adjustedMax < adjustedMin) {
      adjustedMax = adjustedMin;
    }
    

    return Wrap(
      alignment: _convertAlignment(),
      children: [
        if (preffix != null) preffix!,
        if (preffix != null) 10.width,
        _isHtml(text)
            ? Html(
                data: text,
                style: {
                  "body": Style(
                    fontFamily: 'Selawik',
                    margin: Margins.zero,
                    padding: HtmlPaddings.zero,
                    textAlign: textAlign,
                    fontSize: FontSize(fontSize?.toDouble() ?? 16.0),
                    color: textColor,
                    fontWeight: fontWeight,
                  ),
                },
              )
            : autoResize
            ? FittedBox(
                fit: BoxFit.scaleDown,
                child: AutoSizeText(
                  text,
                  maxLines: maxLines,
                  overflow: overflow ?? TextOverflow.ellipsis,
                  textAlign: textAlign,
                  softWrap: softWrap ?? true,
                  textDirection: textDirection ?? TextDirection.ltr,
                  style: effectiveTextStyle,
                  minFontSize: adjustedMin,
                  maxFontSize: adjustedMax,
                  stepGranularity: step,
                  wrapWords: false,
                ),
              )
            : Text(
                text,
                maxLines: maxLines,
                overflow: overflow ?? TextOverflow.ellipsis,
                textAlign: textAlign,
                softWrap: softWrap ?? true,
                textDirection: textDirection ?? TextDirection.ltr,
                style: baseTextStyle,
              ),
        if (suffix != null) 10.width,
        if (suffix != null) suffix!,
        if (suffix != null) 10.width,
      ],
    );
  }

  bool _isHtml(String input) {
    final htmlRegex = RegExp(r"<[^>]+>", multiLine: true, caseSensitive: false);
    return htmlRegex.hasMatch(input);
  }

  TextStyle getStyle() {
    var style =
        this.style ??
        GoogleFonts.dmSans(
          fontSize: fontSize?.sp ?? 12.sp,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: textColor ?? getTheme.textTheme.bodyMedium?.color,
        );  
    final double? fontHeight = textHeight != null ? textHeight! / style.fontSize! : null;
    if (textColor != null) {
      style = style.copyWith(color: textColor, height: fontHeight);
    }
    if (fontWeight != null) {
      style = style.copyWith(fontWeight: fontWeight, height: fontHeight);
    }
    if (fontSize != null) {
      style = style.copyWith(fontSize: fontSize!.sp, height: fontHeight);
    }
    return style;
  }
}
