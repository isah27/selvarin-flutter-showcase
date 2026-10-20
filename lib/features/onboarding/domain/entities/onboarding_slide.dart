import 'package:flutter/foundation.dart';

@immutable
class OnboardingSlide {
  const OnboardingSlide({
    required this.loopAsset,
    required this.eyebrow,
    required this.title,
    required this.subtitle,
  });

  final String loopAsset;
  final String eyebrow;
  final String title;
  final String subtitle;
}
