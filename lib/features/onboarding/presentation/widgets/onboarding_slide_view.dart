import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_sizes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../domain/entities/onboarding_slide.dart';
import '../providers/onboarding_providers.dart';
import 'onboarding_loop.dart';
import 'onboarding_slide_copy.dart';

class OnboardingSlideView extends ConsumerWidget {
  const OnboardingSlideView({
    required this.slide,
    required this.pageIndex,
    super.key,
  });

  final OnboardingSlide slide;
  final int pageIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Rebuilds only when this page becomes active or inactive.
    final bool active = ref.watch(
      onboardingIndexProvider.select((int index) => index == pageIndex),
    );
    // Whole pixels, so the film never leaves a hairline seam.
    final double loopHeight =
        (MediaQuery.sizeOf(context).height * AppSizes.loopFraction)
            .floorToDouble();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        OnboardingLoop(
          asset: slide.loopAsset,
          height: loopHeight,
          active: active,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: OnboardingSlideCopy(slide: slide),
        ),
      ],
    );
  }
}
