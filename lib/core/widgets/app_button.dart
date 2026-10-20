import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_radii.dart';
import '../theme/app_sizes.dart';
import '../theme/app_spacing.dart';
import 'app_text.dart';

enum AppButtonVariant { primary, ghost }

class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.expanded = true,
    this.foreground,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool expanded;
  final Color? foreground;

  @override
  Widget build(BuildContext context) {
    final bool primary = variant == AppButtonVariant.primary;
    return SizedBox(
      height: AppSizes.buttonHeight,
      width: expanded ? double.infinity : null,
      child: Material(
        color: primary ? AppColors.racingGreen : AppColors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadii.pill,
          side: primary
              ? BorderSide.none
              : BorderSide(color: foreground ?? AppColors.divider),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: Center(
              widthFactor: 1,
              child: AppText(
                label.toUpperCase(),
                variant: AppTextVariant.label,
                color: primary
                    ? AppColors.white
                    : foreground ?? AppColors.graphite,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
