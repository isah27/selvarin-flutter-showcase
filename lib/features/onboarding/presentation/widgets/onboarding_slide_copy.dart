import 'package:flutter/widgets.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_text.dart';
import '../../domain/entities/onboarding_slide.dart';

class OnboardingSlideCopy extends StatelessWidget {
  const OnboardingSlideCopy({required this.slide, super.key});

  final OnboardingSlide slide;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppText(slide.eyebrow, variant: AppTextVariant.label),
        const SizedBox(height: AppSpacing.sm),
        AppText(slide.title, variant: AppTextVariant.display),
        const SizedBox(height: AppSpacing.sm),
        AppText(slide.subtitle),
      ],
    );
  }
}
