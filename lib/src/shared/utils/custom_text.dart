import 'package:challenge/src/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class CustomTexts {
  static Text smallText(String text,
          {textAlign = TextAlign.left,
          fontWeight = FontWeight.w500,
          double fontSize = 10,
          int maxLines = 1,
          color = AppColors.neutralColorLowPure}) =>
      Text(text,
          maxLines: maxLines,
          style: TextStyle(
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: color,
            overflow: TextOverflow.ellipsis,
          ));

  static Text mediumText(String text,
          {textAlign = TextAlign.left,
          fontWeight = FontWeight.w500,
          double fontSize = 12,
          int maxLines = 1,
          color = AppColors.neutralColorLowPure}) =>
      Text(text,
          maxLines: maxLines,
          style: TextStyle(
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: color,
            overflow: TextOverflow.ellipsis,
          ));

  static Text bigText(String text,
          {textAlign = TextAlign.left,
          fontWeight = FontWeight.w600,
          double fontSize = 14,
          int maxLines = 1,
          color = AppColors.neutralColorLowPure}) =>
      Text(text,
          maxLines: maxLines,
          style: TextStyle(
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: color,
            overflow: TextOverflow.ellipsis,
          ));
}
