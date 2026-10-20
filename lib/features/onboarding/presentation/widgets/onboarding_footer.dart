import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../providers/onboarding_providers.dart';
import 'page_indicator.dart';

class OnboardingFooter extends ConsumerWidget {
  const OnboardingFooter({required this.onNext, super.key});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLast = ref.watch(onboardingIsLastProvider);
    return SafeArea(
      minimum: const EdgeInsets.all(AppSpacing.lg),
      child: Row(
        children: <Widget>[
          const PageIndicator(),
          const Spacer(),
          AppButton(
            label: isLast ? AppStrings.shopNow : AppStrings.next,
            onPressed: onNext,
            expanded: false,
          ),
        ],
      ),
    );
  }
}
