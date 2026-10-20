import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_durations.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_sizes.dart';
import '../../../../core/theme/app_spacing.dart';

class IndicatorDot extends StatelessWidget {
  const IndicatorDot({required this.active, super.key});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppDurations.medium,
      curve: Curves.easeOut,
      margin: const EdgeInsets.only(right: AppSpacing.xs),
      height: AppSizes.indicatorDot,
      width: active ? AppSizes.indicatorActive : AppSizes.indicatorDot,
      decoration: BoxDecoration(
        color: active ? AppColors.racingGreen : AppColors.divider,
        borderRadius: AppRadii.pill,
      ),
    );
  }
}
