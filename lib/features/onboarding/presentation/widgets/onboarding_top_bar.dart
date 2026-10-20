import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/brand_wordmark.dart';

/// Shown above every slide: the brand, plus a Skip that goes straight to
/// the shop, so nobody is ever stuck behind the films.
class OnboardingTopBar extends StatelessWidget {
  const OnboardingTopBar({required this.onSkip, super.key});

  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      child: Row(
        children: <Widget>[
          const BrandWordmark(color: AppColors.white),
          const Spacer(),
          Semantics(
            button: true,
            label: AppStrings.skip,
            child: Material(
              color: AppColors.scrim,
              shape: const RoundedRectangleBorder(
                borderRadius: AppRadii.pill,
                side: BorderSide(color: AppColors.hairline),
              ),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: onSkip,
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.sm,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      AppText(
                        AppStrings.skip,
                        variant: AppTextVariant.title,
                        color: AppColors.white,
                      ),
                      SizedBox(width: AppSpacing.xs),
                      Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
