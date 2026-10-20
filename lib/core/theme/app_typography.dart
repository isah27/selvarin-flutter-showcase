import 'package:flutter/painting.dart';

import 'app_colors.dart';

/// Light, wide-tracked sans: precise and quiet, like a dial.
abstract final class AppTypography {
  static const TextStyle display = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w300,
    height: 1.15,
    letterSpacing: -0.4,
    color: AppColors.graphite,
  );
  static const TextStyle headline = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    height: 1.2,
    color: AppColors.graphite,
  );
  static const TextStyle title = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
    color: AppColors.graphite,
  );
  static const TextStyle body = TextStyle(
    fontSize: 14,
    height: 1.5,
    color: AppColors.steel,
  );
  static const TextStyle label = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    letterSpacing: 2.6,
    color: AppColors.racingGreen,
  );
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    letterSpacing: 0.3,
    color: AppColors.steel,
  );
  static const TextStyle wordmark = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    letterSpacing: 6,
    color: AppColors.graphite,
  );
}
