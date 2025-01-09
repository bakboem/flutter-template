import 'dart:io';
import 'package:flutter/material.dart';
import 'export_common.dart';

class AppStyles {
  static OutlineInputBorder defaultBorder = OutlineInputBorder(
      gapPadding: 0,
      borderSide:
          const BorderSide(color: AppColors.unReadyButtonBorderColor, width: 1),
      borderRadius: BorderRadius.circular(AppSize.radius5));
  static OutlineInputBorder focusedBorder = OutlineInputBorder(
      gapPadding: 0,
      borderSide: const BorderSide(color: AppColors.primary, width: 1),
      borderRadius: BorderRadius.circular(AppSize.radius5));

  static BoxDecoration shadowBoxDecoration({
    bool isCompleted = false,
    Color? borderColor,
    double? borderWidth,
    Color? color,
    bool isHovered = false,
    bool isQuestionCard = false,
    int? selectedIndex,
    int? index,
    Color? boxShadowColor,
    double? blur,
  }) {
    final defaultColor = isCompleted ? AppColors.primary : AppColors.whiteText;

    return BoxDecoration(
      color: color ?? defaultColor,
      boxShadow: isHovered
          ? [
              BoxShadow(
                color: isQuestionCard
                    ? AppColors.primary.withOpacity(0.5)
                    : AppColors.defaultText.withOpacity(0.7),
                spreadRadius: 0,
                blurRadius: 5,
                offset: Offset(0, 0),
              ),
            ]
          : [
              BoxShadow(
                color: AppColors.defaultText.withOpacity(0.2),
                offset: Offset(0, 0),
                spreadRadius: 0,
                blurRadius: 5,
              ),
            ],
      border: borderColor != null && borderWidth != null
          ? Border.all(color: borderColor, width: borderWidth)
          : null,
      borderRadius: borderColor != null && borderWidth != null
          ? BorderRadius.zero
          : BorderRadius.circular(2.0),
    );
  }

  static Widget buildSmallButton(
      BuildContext context, String buttonText, Function callback,
      {bool? doNotWithPadding,
      double? width,
      Color? color,
      TextStyle? textStyle,
      Color? borderColor}) {
    return Padding(
        padding: doNotWithPadding != null
            ? EdgeInsets.all(AppSize.zero)
            : EdgeInsets.symmetric(vertical: AppSize.padding),
        child: AppStyles.buildButton(
            context,
            buttonText,
            width ?? AppSize.smallButtonWidth,
            color ?? AppColors.sendButtonColor,
            textStyle ?? AppTextStyle.color_16(AppColors.primary),
            AppSize.radius5,
            () => callback.call(),
            isWithBorder: true,
            borderColor: AppColors.homeBgColor,
            selfHeight: AppSize.defaultTextFieldHeight));
  }

  /// [Container]로 일반 버튼 paint 할때 기본 양식 사전 정의.
  static Widget buildButton(BuildContext context, String text, double width,
      Color bgColor, TextStyle style, double radius, VoidCallback callback,
      {bool? isLeft,
      bool? isBottomButton,
      bool? isWithBottomRadius,
      double? selfHeight,
      bool? isWithBorder,
      Color? borderColor,
      bool? isWithRightBorder,
      bool? isOnlyTopBorder,
      bool? isOnlyTopAndRightBorder}) {
    return GestureDetector(
      onTap: callback.call,
      child: Container(
          alignment: Alignment.center,
          height: isBottomButton == null
              ? selfHeight ?? AppSize.buttonHeight
              : Platform.isIOS
                  ? AppSize.buttonHeight
                  : AppSize.buttonHeight,
          width: width,
          decoration: BoxDecoration(
              color: bgColor,
              border: isWithRightBorder != null && (isLeft ?? false)
                  ? Border(right: BorderSide(color: AppColors.whiteText))
                  : isWithBorder != null
                      ? Border.all(
                          color: borderColor!,
                          width: AppSize.defaultBorderWidth)
                      : isOnlyTopBorder != null
                          ? Border(
                              top: BorderSide(
                                  width: .5, color: AppColors.textGrey))
                          : isOnlyTopAndRightBorder != null
                              ? isLeft != null
                                  ? Border(
                                      top: BorderSide(
                                          width: .5, color: AppColors.textGrey),
                                      right: BorderSide(
                                          width: .5, color: AppColors.textGrey))
                                  : Border(
                                      top: BorderSide(
                                          width: .5, color: AppColors.textGrey),
                                    )
                              : null,
              borderRadius: isLeft != null
                  ? isLeft
                      ? BorderRadius.only(bottomLeft: Radius.circular(radius))
                      : BorderRadius.only(bottomRight: Radius.circular(radius))
                  : isWithBottomRadius != null
                      ? isWithBottomRadius
                          ? BorderRadius.only(
                              bottomLeft: Radius.circular(radius),
                              bottomRight: Radius.circular(radius))
                          : null
                      : BorderRadius.all(Radius.circular(radius))),
          child: AppText.text('$text', style: style)),
    );
  }

  /// [TextButton] 사용시 style 사전 정의.
  static ButtonStyle getButtonStyle(Color backgroundColor, Color forgroundColor,
      TextStyle textStyle, double radius,
      {WidgetStateProperty<EdgeInsetsGeometry?>? padding}) {
    return ButtonStyle(
      padding: padding,
      backgroundColor: WidgetStateProperty.all(backgroundColor),
      foregroundColor: WidgetStateProperty.all(forgroundColor),
      textStyle: WidgetStateProperty.all(textStyle),
      shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius))),
    );
  }

// Pipe 공통 style.
  static Widget buildPipe({double? height}) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppSize.defaultListItemSpacing,
          right: AppSize.defaultListItemSpacing),
      child: Container(
          height: height ??
              (AppTextStyle.h4.fontSize ?? AppTextStyle.hint_16.fontSize!) - 2,
          decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: AppColors.textGrey)))),
    );
  }

  static Widget buildTitleRow(String text, {bool? isNotwithStart}) {
    return Row(children: [
      AppText.text(text, style: AppTextStyle.h4),
      SizedBox(width: AppSize.defaultListItemSpacing / 2),
      isNotwithStart != null && isNotwithStart
          ? Container()
          : AppText.text('*',
              style: AppTextStyle.h4.copyWith(color: AppColors.dangerColor))
    ]);
  }

  static Widget defultRowSpacing() {
    return Padding(
        padding: EdgeInsets.only(right: AppSize.defaultListItemSpacing));
  }

  static ShapeBorder? zeroShapeBorder() {
    return ShapeBorder.lerp(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      0.0,
    );
  }
}
