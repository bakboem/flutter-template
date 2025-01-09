/*
 * Project Name:  [Tema]
 * File: /Users/bakbeom/work/sm/temaapp/lib/enums/language_type.dart
 * Created Date: 2024-04-24 14:29:32
 * Last Modified: 2024-10-08 17:48:30
 * Author: bakbeom
 * Modified By: bakbeom
 * copyright ⓒ Surginus All rights reserved. 
 * ---  --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
 *                        Discription                         
 * ---  --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
 */

import 'package:template/common/function/common_function.dart';
import 'package:flutter/material.dart';

enum LanguageType {
  KR,
  CN,
  JP,
  US,
  SA,
  TH,
  VN,
// DE, FR, IT, ES, IN, KZ, PH,
  ID,
}

extension LanguageTypeExtension on LanguageType {
  String get code {
    switch (this) {
      case LanguageType.KR:
        return 'ko';
      case LanguageType.CN:
        return 'zh';
      case LanguageType.JP:
        return 'ja';
      case LanguageType.US:
        return 'en';
      case LanguageType.SA:
        return 'ar';
      case LanguageType.TH:
        return 'th';
      case LanguageType.VN:
        return 'vi';
      // case LanguageType.DE:
      //   return 'de';
      // case LanguageType.FR:
      //   return 'fr';
      // case LanguageType.IT:
      //   return 'it';
      // case LanguageType.ES:
      //   return 'es';
      // case LanguageType.IN:
      //   return 'ta';
      // case LanguageType.KZ:
      //   return 'kk';
      // case LanguageType.PH:
      //   return 'en';
      case LanguageType.ID:
        return 'id';
    }
  }

  String get timeZone {
    switch (this) {
      case LanguageType.KR:
        return 'Asia/Seoul';
      case LanguageType.CN:
        return 'Asia/Shanghai';
      case LanguageType.JP:
        return 'Asia/Tokyo';
      case LanguageType.US:
        return 'America/New_York';
      case LanguageType.SA:
        return 'Asia/Riyadh';
      case LanguageType.TH:
        return 'Asia/Bangkok';
      case LanguageType.VN:
        return 'Asia/Ho_Chi_Minh';
      // case LanguageType.DE:
      //   return 'Europe/Berlin';
      // case LanguageType.FR:
      //   return 'Europe/Paris';
      // case LanguageType.IT:
      //   return 'Europe/Rome';
      // case LanguageType.ES:
      //   return 'Europe/Madrid';
      // case LanguageType.IN:
      //   return 'Asia/Kolkata';
      // case LanguageType.KZ:
      //   return 'Asia/Almaty';
      // case LanguageType.PH:
      //   return 'Asia/Manila';
      case LanguageType.ID:
        return 'Asia/Jakarta';
    }
  }

  String get changeText {
    switch (this) {
      case LanguageType.KR:
        return '변경';
      case LanguageType.CN:
        return '更改';
      case LanguageType.JP:
        return '変更';
      case LanguageType.US:
        return 'change';
      case LanguageType.SA:
        return 'تغيير';
      case LanguageType.TH:
        return 'เปลี่ยนแปลง';
      case LanguageType.VN:
        return 'thay đổi';
      // case LanguageType.DE:
      //   return 'ändern';
      // case LanguageType.FR:
      //   return 'changement';
      // case LanguageType.IT:
      //   return 'cambiare';
      // case LanguageType.ES:
      //   return 'cambio';
      // case LanguageType.IN:
      //   return 'perubahan';
      // case LanguageType.KZ:
      //   return 'өзгерту';
      // case LanguageType.PH:
      //   return 'pagbabago';
      case LanguageType.ID:
        return 'perubahan';
    }
  }

  String get localText {
    switch (this) {
      case LanguageType.KR:
        return '한국어';
      case LanguageType.CN:
        return '简体中文';
      case LanguageType.JP:
        return '日本語';
      case LanguageType.US:
        return 'English';
      case LanguageType.SA:
        return 'عربي';
      case LanguageType.TH:
        return 'ภาษาไทย';
      case LanguageType.VN:
        return 'Tiếng Việt';
      // case LanguageType.DE:
      //   return 'Deutsch';
      // case LanguageType.FR:
      //   return 'Français';
      // case LanguageType.IT:
      //   return 'italiano';
      // case LanguageType.ES:
      //   return 'Español';
      // case LanguageType.IN:
      //   return 'भारतीय भाषा';
      // case LanguageType.KZ:
      //   return 'Қазақ тілі';
      // case LanguageType.PH:
      //   return 'Filipino';
      case LanguageType.ID:
        return 'bahasa Indonesia';
    }
  }

  LanguageType getLanguageTypeFromTimeZone(String timeZone) {
    switch (timeZone) {
      case 'Asia/Seoul':
        return LanguageType.KR;
      case 'Asia/Shanghai':
        return LanguageType.CN;
      case 'Asia/Tokyo':
        return LanguageType.JP;
      case 'America/New_York':
        return LanguageType.US;

      case 'Asia/Riyadh':
        return LanguageType.SA;
      case 'Asia/Bangkok':
        return LanguageType.TH;
      case 'Ho_Chi_Minh':
        return LanguageType.VN;
      // case 'Europe/Berlin':
      //   return LanguageType.DE;
      // case 'Europe/Paris':
      //   return LanguageType.FR;
      // case 'Europe/Rome':
      //   return LanguageType.IT;
      // case 'Europe/Madrid':
      //   return LanguageType.ES;
      // case 'Asia/Kolkata':
      //   return LanguageType.IN;
      // case 'Asia/Almaty':
      //   return LanguageType.KZ;
      // case 'Asia/Manila':
      //   return LanguageType.PH;
      case 'Asia/Jakarta':
        return LanguageType.ID;

      default:
        return LanguageType.US;
    }
  }

  Locale get locale {
    switch (this) {
      default:
        try {
          return Locale(this.code);
        } catch (e) {
          pr('Error creating locale: $e');
          return Locale('en');
        }
    }
  }
}
