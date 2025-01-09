import 'package:template/services/key_service.dart';
import 'package:flutter/widgets.dart';

// 각종 사이즈 데이터 사전 등록.
class AppSize {
  static double fontSize(double size) => size;
  static double bottomSafeAreaHeight(BuildContext context) =>
      MediaQuery.of(context).padding.bottom;
  static double topSafeAreaHeight(BuildContext context) =>
      MediaQuery.of(context).padding.top;
  static double get defaultContentsWidth => realWidth - padding * 2;
  static double get zero => 0;
  static double get one => 1;
  static double get two => 2;
  static double get scale2 => 1.2;
  static double get scale2_5 => 2.5;
  static double get s30 => 30;
  static double get s35 => 35;
  static double get s20 => 20;
  static double get s25 => 25;
  static double get s16 => 16;
  static double get s100 => 100;
  static double get s80 => 80;
  static double get s60 => 60;
  static double get s12 => 12;
  static double get s120 => 120;
  static double get s13 => 13;
  static double get s10 => 10;
  static double get cardHeight => 216;
  static double get cardWidth => 150;
  static double get chartWidth => realWidth - AppSize.padding * 2 - 24;
  static double get chartHeight => 220;
  static double get minTemperature => 34;
  static double get hitTemperature => 40;
  static double get chartPointRadius => 3;

  static double get realWidth =>
      MediaQuery.of(KeyService.baseAppKey.currentContext!).size.width;
  static double get realHeight =>
      MediaQuery.of(KeyService.baseAppKey.currentContext!).size.height;
  static double get smallIconWidth => 12;
  static double get toastHeight => 250;

  static double get defaultPopupHeight => 200;
  static double get padding => 14;
  static double get popHeight => 430;
  static double get chartContainerHeight => 430;
  static double get defaultCheckBoxHeight => 20;
  static double get dangerPopHeight => 157;
  static double get appBarHeight => 56;
  static double get smallButtonWidth => 100;
  static double get lableButtonWidth => 80;
  static double get lableButtonHeight => 25;
  static double get homeFixedContentsHeight => 110;
  static double get splashIconHeight => 60;
  static double get smallButtonHeight => 32;
  static double get datePickerButtonHeight => 28;
  static double get prefixIconWidth => 24;
  static double get smallPopupHeight => 340;
  static double get singlePopupHeight => 150;
  static double get buttonHeight => 55;
  static double get strokeWidth => 2;
  static double get defaultBorderWidth => 1;
  static double get drawerTopPadding => 4;
  static double get drawerIconSize => 25;
  static double get drawerBottomPadding => AppSize.realHeight * .03;
  static double get radius5 => 5;
  static double get radius4 => 4;
  static double get radius3 => 3;
  static double get radius8 => 8;
  static double get radius15 => 13;
  static double get radius18 => 18;
  static double get radius20 => 20;
  static double get radius25 => 25;
  static double get radius29 => 29;
  static double get radius40 => 40;
  static double get radius50 => 50;
  static double get radius60 => 60;
  static double get cellPadding => 10;
  static double get defaultTextFieldHeight => 42;
  static double get defaultListItemSpacing => 9;
  static double get customerTextFiledIconMaxWidth => 24;
  static double get customerTextFiledIconSidePadding => 12;
  static double get iconSmallDefaultWidth => 12;
  static double get customerTextFiledIconMainWidth => 18;
  static double get itemExtent => 40;
  static double get indigatorPoint => 6;
  static double get defaultIconWidth => 18;

  static double get secondPopupHeight => 346;
  static double get weightPopupHeight => 360;
  static double get textRowModelShowAllIconTopPadding => 8;
  static EdgeInsets get signinLogoPadding =>
      const EdgeInsets.fromLTRB(0, 50, 0, 30);
  static EdgeInsets get defaultTagPadding =>
      const EdgeInsets.only(left: 8, right: 8, top: 3, bottom: 3);
  static double buildWidth(BuildContext context, double multiple) =>
      MediaQuery.of(context).size.width * multiple;
  static EdgeInsets get textRowModelLinePadding =>
      const EdgeInsets.only(top: 8, bottom: 8);
  static EdgeInsets get defaultSidePadding =>
      EdgeInsets.only(left: padding, right: padding);
  static EdgeInsets get deviceChoiseIconsPadding =>
      EdgeInsets.only(left: padding * 4, right: padding * 4);
  static EdgeInsets get nullValueWidgetPadding =>
      EdgeInsets.only(left: padding, top: 50, bottom: 50, right: padding);
  static double get searchBarTitleSidePadding => 20;
  static EdgeInsets defaultTextFieldPadding(double textHeight,
          {double? boxHeight}) =>
      EdgeInsets.fromLTRB(
          12,
          boxHeight != null
              ? ((boxHeight - textHeight - 2) / 2) - 2
              : ((defaultTextFieldHeight - textHeight - 2) / 2) - 2,
          12,
          boxHeight != null
              ? ((boxHeight - textHeight - 2) / 2)
              : ((defaultTextFieldHeight - textHeight - 2) / 2));
  static double chartTopPadding = 100.0;
  static double chartTopPaddingForTimeline = 160.0;
  static EdgeInsets chartPadding = EdgeInsets.only(left: 0, right: padding / 2);
  static EdgeInsets chartPaddingForTimeline = EdgeInsets.only(
      left: AppSize.padding, top: chartTopPaddingForTimeline, right: 22);

  static EdgeInsets defaultTextFieldPaddingWidthSigninPage(double fontSize,
          {double? boxHeight}) =>
      EdgeInsets.fromLTRB(
        12,
        boxHeight != null
            ? (boxHeight - fontSize - 2) / 2
            : (defaultTextFieldHeight - fontSize - 2) / 2,
        12,
        boxHeight != null
            ? (boxHeight - fontSize - 2) / 2
            : (defaultTextFieldHeight - fontSize - 2) / 2,
      );
}
