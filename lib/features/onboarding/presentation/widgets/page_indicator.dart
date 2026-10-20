import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/onboarding_providers.dart';
import 'indicator_dot.dart';

class PageIndicator extends ConsumerWidget {
  const PageIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int index = ref.watch(onboardingIndexProvider);
    final int count = ref.watch(onboardingSlidesProvider).length;
    return RepaintBoundary(
      child: Row(
        children: List<Widget>.generate(
          count,
          (int i) => IndicatorDot(key: ValueKey<int>(i), active: i == index),
        ),
      ),
    );
  }
}
