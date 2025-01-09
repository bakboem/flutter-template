/*
 * Project Name:  [Tema1.0] - 
 * File: /Users/bakbeom/work/sm/si/SalesPortal/lib/view/common/app_dialog.dart
 * Created Date: 2021-08-23 13:52:24
 * Last Modified: 2024-05-09 15:14:26
 * Author: bakbeom
 * Modified By: bakbeom
 * copyright @ 2022  SURGINUS(주). ALL RIGHTS RESERVED. 
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 * 												Discription													
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 */

import 'package:template/common/view/widget_of_default_spacing.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../styles/export_common.dart';

class AppDialog {
  static dynamic showPopup(BuildContext context,
      {String? title,
      String? body,
      bool? isSingleButton,
      void Function()? successCallback,
      bool? isWithShapeBorder,
      Widget? bodyWidget,
      Widget? widget,
      bool? isCanPop,
      bool? isWithTitle,
      String? buttonStr1,
      String? buttonStr2,
      TextAlign? align,
      double? height}) {
    return showDialog(
        useSafeArea: false,
        context: context,
        builder: (ctx) => AlertDialog(
            actionsPadding: EdgeInsets.zero,
            buttonPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            content: PopScope(
                canPop: isCanPop ?? true,
                child: widget != null
                    ? widget
                    : _buildDefaultPopup(context, title!, body!,
                        isSingleButton!, isWithTitle, bodyWidget, align,
                        buttonStr1: buttonStr1,
                        buttonStr2: buttonStr2,
                        successCallback: successCallback,
                        height: height))));
  }

  static Widget _buildDefaultPopup(
      BuildContext context,
      String? title,
      String body,
      bool isSingleButton,
      bool? isWithTitle,
      Widget? bodyWidget,
      TextAlign? align,
      {void Function()? successCallback,
      String? buttonStr1,
      String? buttonStr2,
      double? height}) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.whiteText,
          borderRadius: BorderRadius.circular(AppSize.radius15)),
      width: AppSize.realWidth * .8,
      height: height ?? AppSize.defaultPopupHeight + (13 * (body.length / 20)),
      child: Column(
        children: [
          isWithTitle ?? false ? _buildTitle(context, title ?? '') : SizedBox(),
          bodyWidget ??
              _buildBody(
                context,
                body,
                title,
                isWithTitle,
                align: align,
              ),
          isSingleButton
              ? _buildSingleButton(
                  context,
                  buttonStr: buttonStr1,
                  successCallback: successCallback,
                )
              : _buildDoubleButton(context,
                  buttonStr1: buttonStr1,
                  buttonStr2: buttonStr2,
                  successCallback: successCallback)
        ],
      ),
    );
  }

  static Widget _buildSingleButton(BuildContext context,
      {String? buttonStr, void Function()? successCallback}) {
    return GestureDetector(
      onTap: successCallback,
      child: Container(
          height: AppSize.buttonHeight,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: AppColors.hintText))),
          child: AppText.text(buttonStr ?? tr('ok'),
              style:
                  AppTextStyle.default_16.copyWith(color: AppColors.primary))),
    );
  }

  static Widget _buildButton(
      BuildContext context, String text, void Function()? successCallback,
      {required bool isLeft}) {
    const borderSide = BorderSide(color: AppColors.unReadyButtonBorderColor);
    return Container(
      width: AppSize.realWidth * .8 / 2,
      height: AppSize.buttonHeight,
      decoration: BoxDecoration(
          border: isLeft
              ? const Border(
                  right: borderSide,
                  top: borderSide,
                )
              : const Border(top: borderSide)),
      child: TextButton(
        onPressed: successCallback,
        child: AppText.text(text,
            style: AppTextStyle.color14(
                isLeft ? AppColors.defaultText : AppColors.primary)),
      ),
    );
  }

  static Widget _buildDoubleButton(BuildContext context,
      {String? buttonStr1,
      String? buttonStr2,
      void Function()? successCallback}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildButton(context, buttonStr2 ?? tr('cancel'), () {
          Navigator.pop(context, true);
        }, isLeft: true),
        _buildButton(context, buttonStr1 ?? tr('ok'), successCallback,
            isLeft: false),
      ],
    );
  }

  static Widget _buildTitle(BuildContext context, String str,
      {TextStyle? style}) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.subText))),
      height: AppSize.buttonHeight,
      child: Center(
        child: AppText.text(str, style: style ?? AppTextStyle.bold_16),
      ),
    );
  }

  static Widget _buildBody(
      BuildContext context, String str, String? title, bool? isWidthTitle,
      {TextStyle? style, TextAlign? align}) {
    return Expanded(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.padding * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (title != null && title.isNotEmpty && isWidthTitle == false)
                AppText.text(title, style: AppTextStyle.default_16),
              if (title != null && title.isNotEmpty && isWidthTitle == false)
                defaultSpacing(times: 2),
              AppText.text(str,
                  style: style ?? AppTextStyle.default_14,
                  maxLines: 10,
                  textAlign: align ?? TextAlign.left),
            ],
          )),
    );
  }
}
