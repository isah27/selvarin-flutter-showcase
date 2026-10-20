import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:selvarin/app.dart';
import 'package:selvarin/core/constants/app_strings.dart';
import 'package:selvarin/features/home/presentation/pages/home_page.dart';

void main() {
  Future<void> pumpApp(WidgetTester tester) async {
    tester.view.physicalSize = const Size(412, 915);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(const ProviderScope(child: SelvarinApp()));
    await tester.pump();
  }

  testWidgets('Skip is visible on every onboarding slide', (
    WidgetTester tester,
  ) async {
    await pumpApp(tester);
    for (int page = 0; page < 3; page++) {
      expect(find.text(AppStrings.skip), findsOneWidget);
      if (page < 2) {
        await tester.tap(find.text(AppStrings.next.toUpperCase()));
        await tester.pumpAndSettle();
      }
    }
    expect(find.text(AppStrings.shopNow.toUpperCase()), findsOneWidget);
  });

  testWidgets('Skip goes straight to the shop from the first slide', (
    WidgetTester tester,
  ) async {
    await pumpApp(tester);
    await tester.tap(find.text(AppStrings.skip));
    await tester.pumpAndSettle();
    expect(find.byType(HomePage), findsOneWidget);
    expect(find.text(AppStrings.collectionTitle), findsOneWidget);
  });
}
