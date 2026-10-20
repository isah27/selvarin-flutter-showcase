import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/demo/demo_tour.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_durations.dart';
import '../../../../core/theme/app_sizes.dart';
import '../../../../core/utils/image_cache_size.dart';
import '../../../../core/utils/sized_asset_image.dart';
import '../../domain/entities/onboarding_slide.dart';
import '../demo/onboarding_tour.dart';
import '../providers/onboarding_index_notifier.dart';
import '../providers/onboarding_providers.dart';
import '../widgets/onboarding_footer.dart';
import '../widgets/onboarding_slide_view.dart';
import '../widgets/onboarding_top_bar.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  final PageController _pageController = PageController();
  bool _precached = false;

  @override
  void initState() {
    super.initState();
    if (DemoTour.enabled) {
      unawaited(
        OnboardingTour(
          pageController: _pageController,
          pageCount: ref.read(onboardingSlidesProvider).length,
          onSkip: _goToShop,
          isActive: () => mounted,
        ).run(),
      );
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_precached) {
      return;
    }
    _precached = true;
    // Same ResizeImage keys as the widgets that draw them.
    final int loopWidth = ImageCacheSize.forExtent(
      context,
      MediaQuery.sizeOf(context).width,
    );
    for (final OnboardingSlide slide in ref.read(onboardingSlidesProvider)) {
      unawaited(
        precacheImage(SizedAssetImage.of(slide.loopAsset, loopWidth), context),
      );
    }
    // The shop's featured banner image, so home opens with it ready.
    unawaited(
      precacheImage(
        SizedAssetImage.of(
          AppAssets.featured,
          ImageCacheSize.forExtent(context, AppSizes.bannerImageWidth),
        ),
        context,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToShop() {
    unawaited(Navigator.of(context).pushReplacementNamed(AppRoutes.home));
  }

  void _next() {
    if (ref.read(onboardingIsLastProvider)) {
      _goToShop();
      return;
    }
    unawaited(
      _pageController.nextPage(
        duration: AppDurations.page,
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<OnboardingSlide> slides = ref.watch(onboardingSlidesProvider);
    final OnboardingIndexNotifier index = ref.read(
      onboardingIndexProvider.notifier,
    );
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _pageController,
            itemCount: slides.length,
            onPageChanged: index.show,
            itemBuilder: (_, int i) => OnboardingSlideView(
              key: ValueKey<String>(slides[i].loopAsset),
              slide: slides[i],
              pageIndex: i,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: OnboardingTopBar(onSkip: _goToShop),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: OnboardingFooter(onNext: _next),
          ),
        ],
      ),
    );
  }
}
