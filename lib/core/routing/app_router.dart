import 'package:flutter/material.dart';

import '../../features/home/domain/entities/product.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/pages/product_detail_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../theme/app_durations.dart';
import 'app_routes.dart';

abstract final class AppRouter {
  static Route<void> onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      AppRoutes.home => _fade(const HomePage(), settings),
      AppRoutes.productDetail => _fade(
        ProductDetailPage(product: settings.arguments! as Product),
        settings,
      ),
      _ => _fade(const OnboardingPage(), settings),
    };
  }

  static Route<void> _fade(Widget page, RouteSettings settings) {
    return PageRouteBuilder<void>(
      settings: settings,
      transitionDuration: AppDurations.route,
      reverseTransitionDuration: AppDurations.route,
      pageBuilder: (_, _, _) => page,
      transitionsBuilder: (_, Animation<double> animation, _, Widget child) =>
          FadeTransition(opacity: animation, child: child),
    );
  }
}
