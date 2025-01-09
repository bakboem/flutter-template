/*
 * Project Name:  [Tema1.0] - 
 * File: /Users/bakbeom/work/sm/si/SalesPortal/lib/enums/image_type.dart
 * Created Date: 2021-08-20 14:37:40
 * Last Modified: 2024-08-30 09:41:41
 * Author: bakbeom
 * Modified By: bakbeom
 * copyright @ 2022  SURGINUS(주). ALL RIGHTS RESERVED. 
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 * 												Discription													
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 */

//* 이미지 url 사전 등록후 사용.

import 'package:easy_localization/easy_localization.dart';

enum ImageType {
  ALARM,
  SPLASH_ICON,
  TEXT_LOGO,
  EMPTY,
  SEARCH,
  SELECT,
  DELETE,
  DATA_PICKER,
  SELECT_RIGHT,
  TAB_1,
  TAB_2,
  TAB_3,
  TAB_4,
  TAB_5,
  DRAWER_MENU,
  BG,
  BG_TITLE,
  LOGO,
  BLE,
  PAN,
  MENU2,
  QR,
  PASSED,
  PEOPLE,
  LOCK,
  P1,
  P2,
  P3,
  P4,
  HUMAN,
  CAMERA,
  EMOTICON,
  GALLERY,
  E1,
  E2,
  E3,
  E4,
  E5,
  E6,
  E7,
  E8,
  E9,
  E10,
  E11,
  E12,
  E13,
  E14,
  D_QUESTION,
  D_SETTING,
  D_INFO,
  D_USER_INFO,

  ATTACH,
  S_ALARM,
  S_VERSON,
  S_LANGUGE,
  S_MARKETING,
  S_USER,
  S_UNIT,
  ICON_HOSPITAL,
  ICON_MEDICINE,
  ALARM_MEDICINE,
  ALARM_MEDICINE_TWO,
  LOGIN_ID,
  LOGIN_LOCK,
  SELECTED,
  UNSELECTED,
  UNSELECTED2,
  BG_TEMP,
  LINE,
  SCALE,
  MARKER,
  HEALTH_TIP,
  HEALTH_OTHER,
  HEALTH_MEDICEN,
  HEALTH_DISEASE,
  SHARE_LINK,
  GET_SHARE_LINK,
  SHARE_GROUPS,
  SHARE_LARGE,
  ON,
  OFF
}

extension RequestTypeExtension on ImageType {
  String get path {
    switch (this) {
      case ImageType.HEALTH_TIP:
        return 'assets/images/h_tips.svg';
      case ImageType.HEALTH_OTHER:
        return 'assets/images/h_other.svg';
      case ImageType.HEALTH_MEDICEN:
        return 'assets/images/h_medicen.svg';
      case ImageType.HEALTH_DISEASE:
        return 'assets/images/h_disease.svg';
      case ImageType.SCALE:
        return 'assets/images/scale.svg';
      case ImageType.MARKER:
        return 'assets/images/marker.svg';
      case ImageType.ALARM:
        return 'assets/images/bell.svg';
      case ImageType.LINE:
        return 'assets/images/line.png';
      case ImageType.BG_TEMP:
        return 'assets/images/bg_temp.svg';
      case ImageType.SELECTED:
        return 'assets/images/selected.svg';
      case ImageType.UNSELECTED:
        return 'assets/images/unselect.svg';
      case ImageType.UNSELECTED2:
        return 'assets/images/unselect2.svg';
      case ImageType.LOGIN_ID:
        return 'assets/images/login_id.svg';
      case ImageType.LOGIN_LOCK:
        return 'assets/images/login_lock.svg';
      case ImageType.ALARM_MEDICINE:
        return 'assets/images/alarm_medicine.png';
      case ImageType.ALARM_MEDICINE_TWO:
        return 'assets/images/alarm_medicine_two.svg';
      case ImageType.ICON_HOSPITAL:
        return 'assets/images/icon_hospital.svg';
      case ImageType.ICON_MEDICINE:
        return 'assets/images/icon_medicine.svg';
      case ImageType.S_ALARM:
        return 'assets/images/s_alarm.svg';
      case ImageType.S_LANGUGE:
        return 'assets/images/s_language.svg';
      case ImageType.S_MARKETING:
        return 'assets/images/s_marketing.svg';
      case ImageType.S_UNIT:
        return 'assets/images/s_unit.svg';
      case ImageType.S_USER:
        return 'assets/images/s_user.svg';
      case ImageType.S_VERSON:
        return 'assets/images/s_temperature.svg';
      case ImageType.ATTACH:
        return 'assets/images/attach.svg';

      case ImageType.D_INFO:
        return 'assets/images/d_info.svg';
      case ImageType.D_USER_INFO:
        return 'assets/images/d_user_info.svg';
      case ImageType.D_SETTING:
        return 'assets/images/d_setting.svg';
      case ImageType.D_QUESTION:
        return 'assets/images/d_answer.svg';
      case ImageType.E1:
        return 'assets/images/e1.svg';
      case ImageType.E2:
        return 'assets/images/e2.svg';
      case ImageType.E3:
        return 'assets/images/e3.svg';
      case ImageType.E4:
        return 'assets/images/e4.svg';
      case ImageType.E5:
        return 'assets/images/e5.svg';
      case ImageType.E6:
        return 'assets/images/e6.svg';
      case ImageType.E7:
        return 'assets/images/e7.svg';
      case ImageType.E8:
        return 'assets/images/e8.svg';
      case ImageType.E9:
        return 'assets/images/e9.svg';
      case ImageType.E10:
        return 'assets/images/e10.svg';
      case ImageType.E11:
        return 'assets/images/e11.svg';
      case ImageType.E12:
        return 'assets/images/e12.svg';
      case ImageType.E13:
        return 'assets/images/e13.svg';
      case ImageType.E14:
        return 'assets/images/e14.svg';
      case ImageType.P1:
        return 'assets/images/p1.png';
      case ImageType.P2:
        return 'assets/images/p2.png';
      case ImageType.P3:
        return 'assets/images/p3.png';
      case ImageType.P4:
        return 'assets/images/p4.png';
      case ImageType.HUMAN:
        return 'assets/images/human.svg';
      case ImageType.CAMERA:
        return 'assets/images/camera.svg';
      case ImageType.EMOTICON:
        return 'assets/images/emoticon.svg';
      case ImageType.GALLERY:
        return 'assets/images/gallery.svg';
      case ImageType.PASSED:
        return 'assets/images/passed.svg';
      case ImageType.PEOPLE:
        return 'assets/images/people.svg';
      case ImageType.LOCK:
        return 'assets/images/lock.svg';
      case ImageType.SPLASH_ICON:
        return 'assets/images/icon_app_material.svg';
      case ImageType.TEXT_LOGO:
        return 'assets/images/logo.svg';
      case ImageType.EMPTY:
        return 'assets/images/empty.svg';
      case ImageType.SEARCH:
        return 'assets/images/search.svg';
      case ImageType.SELECT:
        return 'assets/images/icon_outlined_18_lg_3_down.svg';
      case ImageType.DELETE:
        return 'assets/images/icon_filled_18_lg_3_misuse.svg';
      case ImageType.DATA_PICKER:
        return 'assets/images/icon_outlined_18_lg_3_calendar.svg';
      case ImageType.TAB_1:
        return 'assets/images/tab1.svg';
      case ImageType.TAB_2:
        return 'assets/images/tab2.svg';
      case ImageType.TAB_3:
        return 'assets/images/tab3.svg';
      case ImageType.TAB_4:
        return 'assets/images/tab4.svg';
      case ImageType.TAB_5:
        return 'assets/images/tab5.svg';
      case ImageType.DRAWER_MENU:
        return 'assets/images/drawer_menu.svg';
      case ImageType.BG:
        return 'assets/images/background.png';
      case ImageType.BG_TITLE:
        return 'assets/images/bg_title.png';
      case ImageType.LOGO:
        return 'assets/images/logo_blue.svg';
      case ImageType.BLE:
        return 'assets/images/ble.svg';
      case ImageType.PAN:
        return 'assets/images/pan.svg';
      case ImageType.MENU2:
        return 'assets/images/menu2.svg';
      case ImageType.QR:
        return 'assets/images/qr.svg';
      case ImageType.SHARE_LINK:
        return 'assets/images/share_link.svg';
      case ImageType.GET_SHARE_LINK:
        return 'assets/images/get_shared_link.svg';
      case ImageType.SHARE_GROUPS:
        return 'assets/images/share_groups.svg';
      case ImageType.SHARE_LARGE:
        return 'assets/images/share_large.svg';
      case ImageType.ON:
        return 'assets/images/on.gif';
      case ImageType.OFF:
        return 'assets/images/off.gif';
      default:
        return '';
    }
  }

  bool get isSvg {
    switch (this) {
      case ImageType.ALARM_MEDICINE:
        return false;
      case ImageType.P1:
        return false;
      case ImageType.P2:
        return false;
      case ImageType.P3:
        return false;
      case ImageType.P4:
        return false;
      case ImageType.BG:
        return false;
      case ImageType.BG_TITLE:
        return false;
      case ImageType.LINE:
        return false;
      case ImageType.ON:
        return false;
      case ImageType.OFF:
        return false;
      default:
        return true;
    }
  }

  String get settingsTitle {
    switch (this) {
      case ImageType.S_ALARM:
        return tr('s_alarm_setting');
      case ImageType.S_LANGUGE:
        return tr('s_language_setting');
      case ImageType.S_MARKETING:
        return tr('s_marketing_permission');
      case ImageType.S_VERSON:
        return tr('s_app_version');
      case ImageType.S_USER:
        return tr('s_user_info_change');
      case ImageType.S_UNIT:
        return tr('s_unit_setting');

      default:
        return '';
    }
  }
}
