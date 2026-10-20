import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Current onboarding page. Widgets watch narrow `select`s of it.
class OnboardingIndexNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void show(int index) => state = index;
}
