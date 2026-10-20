import 'package:flutter/widgets.dart';

import '../../../../core/theme/app_durations.dart';

/// Hands-free walk through the slides for screen recordings
/// (only started when `DemoTour.enabled`). Ends by pressing Skip.
class OnboardingTour {
  OnboardingTour({
    required this.pageController,
    required this.pageCount,
    required this.onSkip,
    required this.isActive,
  });

  final PageController pageController;
  final int pageCount;
  final VoidCallback onSkip;
  final bool Function() isActive;

  static const Duration _dwell = Duration(milliseconds: 5600);

  Future<void> run() async {
    for (int page = 1; page < pageCount; page++) {
      await Future<void>.delayed(_dwell);
      if (!isActive()) {
        return;
      }
      await pageController.animateToPage(
        page,
        duration: AppDurations.page,
        curve: Curves.easeInOutCubic,
      );
    }
    await Future<void>.delayed(_dwell);
    if (isActive()) {
      onSkip();
    }
  }
}
