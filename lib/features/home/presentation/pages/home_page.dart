import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/demo/demo_tour.dart';
import '../../../../core/routing/app_routes.dart';
import '../demo/home_tour.dart';
import '../providers/home_providers.dart';
import '../widgets/collection_chips.dart';
import '../widgets/featured_banner.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_search_field.dart';
import '../widgets/product_grid.dart';
import '../widgets/section_header.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final ScrollController _scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    if (DemoTour.enabled) {
      unawaited(
        HomeTour(
          scrollController: _scroll,
          onSelect: ref.read(homeProvider.notifier).selectCollection,
          onOpenProduct: () => unawaited(
            Navigator.of(context).pushNamed(
              AppRoutes.productDetail,
              arguments: ref.read(visibleProductsProvider).first,
            ),
          ),
          onCloseProduct: () => unawaited(Navigator.of(context).maybePop()),
          isActive: () => mounted,
        ).run(),
      );
    }
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          controller: _scroll,
          slivers: const <Widget>[
            SliverToBoxAdapter(child: HomeAppBar()),
            SliverToBoxAdapter(child: HomeSearchField()),
            SliverToBoxAdapter(child: FeaturedBanner()),
            SliverToBoxAdapter(
              child: SectionHeader(title: AppStrings.collectionTitle),
            ),
            SliverToBoxAdapter(child: CollectionChips()),
            ProductGrid(),
          ],
        ),
      ),
    );
  }
}
