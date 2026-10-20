import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/local_onboarding_repository.dart';
import '../../domain/entities/onboarding_slide.dart';
import '../../domain/repositories/onboarding_repository.dart';
import 'onboarding_index_notifier.dart';

final Provider<OnboardingRepository> onboardingRepositoryProvider =
    Provider<OnboardingRepository>(
      (Ref ref) => const LocalOnboardingRepository(),
    );

final Provider<List<OnboardingSlide>> onboardingSlidesProvider =
    Provider<List<OnboardingSlide>>(
      (Ref ref) => ref.watch(onboardingRepositoryProvider).slides(),
    );

final NotifierProvider<OnboardingIndexNotifier, int> onboardingIndexProvider =
    NotifierProvider<OnboardingIndexNotifier, int>(OnboardingIndexNotifier.new);

final Provider<bool> onboardingIsLastProvider = Provider<bool>(
  (Ref ref) =>
      ref.watch(onboardingIndexProvider) ==
      ref.watch(onboardingSlidesProvider).length - 1,
);
