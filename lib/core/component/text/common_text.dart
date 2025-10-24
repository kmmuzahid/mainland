import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mainland/core/config/theme/light_theme.dart';
import 'package:mainland/core/utils/extensions/extension.dart';

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

  bool _isHtml(String input) {
    final htmlRegex = RegExp(r"<[^>]+>", multiLine: true, caseSensitive: false);
    return htmlRegex.hasMatch(input);
  }

  Widget _textField(BuildContext context) {
    final content = _isHtml(text)
        ? Html(
            data: text,
            style: {
              "body": Style(
                // fontSize: FontSize(fontSize ?? 12.sp),
                // color: textColor ?? getTheme.textTheme.bodyMedium?.color,
                // fontWeight: fontWeight ?? FontWeight.w400,
                fontFamily: getTheme.textTheme.bodyLarge?.fontFamily,
                margin: Margins.zero,
                padding: HtmlPaddings.zero,
                textAlign: textAlign,
                // backgroundColor: backgroundColor, // ✅ optional inline fallback
              ),
            },
          )
        : Text(
          text,
          textAlign: textAlign,
          maxLines: maxLines,
          softWrap: true,
            overflow: maxLines == null ? TextOverflow.visible : (overflow ?? TextOverflow.ellipsis),
          style: getStyle(),
          );

    return Container(
      color: backgroundColor ?? Colors.transparent, // ✅ ensure bg color applied
      child: Wrap(
        alignment: _convertAlignment(),
        children: [
          if (preffix != null) preffix!,
          if (preffix != null) 10.width,
          content,
        if (suffix != null) 10.width,
        if (suffix != null) suffix!,
        if (suffix != null) 10.width,
      ],
      ),
    );
  }


  TextStyle getStyle() {
    var style =
        this.style ??
        GoogleFonts.dmSans(
          fontSize: fontSize?.sp ?? 12.sp,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: textColor ?? getTheme.textTheme.bodyMedium?.color,
        );

    if (textColor != null) style = style.copyWith(color: textColor);
    if (fontWeight != null) style = style.copyWith(fontWeight: fontWeight);
    if (fontSize != null) style = style.copyWith(fontSize: fontSize!.sp);
    return style;
  }
}
