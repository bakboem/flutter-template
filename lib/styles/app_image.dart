import 'package:template/enums/image_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'export_common.dart';

/// [ImageType] 에 지정된 SVG 이미지 파일을 [SvgPicture]로 보여주기.
class AppImage {
  static Widget getImage(ImageType imageType,
          {Color? color, bool? isNotFilter}) =>
      imageType.isSvg
          ? SizedBox(
              child: SvgPicture.asset(imageType.path,
                  colorFilter: isNotFilter == true
                      ? null
                      : ColorFilter.mode(
                          color ?? AppColors.primary, BlendMode.srcIn),
                  semanticsLabel: imageType.name),
            )
          : Image(
              image: AssetImage(imageType.path),
              fit: BoxFit.cover,
            );
}
