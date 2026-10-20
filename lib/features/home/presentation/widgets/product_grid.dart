import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_sizes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_text.dart';
import '../../domain/entities/product.dart';
import '../providers/home_providers.dart';
import 'product_card.dart';

class ProductGrid extends ConsumerWidget {
  const ProductGrid({super.key});

  static const SliverGridDelegate _delegate =
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppSpacing.lg,
        crossAxisSpacing: AppSpacing.md,
        childAspectRatio: AppSizes.gridAspect,
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Product> products = ref.watch(visibleProductsProvider);
    if (products.isEmpty) {
      return const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.xl),
          child: AppText(AppStrings.emptyResults, textAlign: TextAlign.center),
        ),
      );
    }
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.md,
        AppSpacing.lg,
        AppSpacing.xxl,
      ),
      sliver: SliverGrid.builder(
        gridDelegate: _delegate,
        itemCount: products.length,
        itemBuilder: (_, int i) => ProductCard(
          key: ValueKey<String>(products[i].id),
          product: products[i],
        ),
      ),
    );
  }
}
