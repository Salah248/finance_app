import 'package:finance_app/resources/font_manager.dart';
import 'package:flutter/material.dart';

class StyleManager {
  static const TextStyle urbanistSemiBold = TextStyle(
    fontFamily: FontConstants.fontFamily,
    fontWeight: FontWeightManager.semiBold,
  );
  static const TextStyle urbanistBold = TextStyle(
    fontFamily: FontConstants.fontFamily,
    fontWeight: FontWeightManager.bold,
  );
  static const TextStyle urbanistMeduim = TextStyle(
    fontFamily: FontConstants.fontFamily,
    fontWeight: FontWeightManager.medium,
  );
  static const TextStyle interSemiBold = TextStyle(
    fontFamily: FontConstants.fontFamily2,
    fontWeight: FontWeightManager.semiBold,
  );
  static const TextStyle interMeduim = TextStyle(
    fontFamily: FontConstants.fontFamily2,
    fontWeight: FontWeightManager.medium,
  );
}
