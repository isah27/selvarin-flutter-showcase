import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_sizes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/image_cache_size.dart';
import '../../../../core/utils/price_formatter.dart';
import '../../../../core/utils/sized_asset_image.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text.dart';
import '../../domain/entities/product.dart';
import '../widgets/product_spec_row.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final double imageHeight = size.height * AppSizes.detailImageFraction;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: imageHeight,
            pinned: true,
            backgroundColor: AppColors.alabaster,
            foregroundColor: AppColors.graphite,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: product.id,
                child: Image(
                  image: SizedAssetImage.of(
                    product.image,
                    ImageCacheSize.forExtent(context, size.width),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            sliver: SliverList.list(
              children: <Widget>[
                AppText(
                  '${product.collection.label.toUpperCase()} · '
                  '${product.reference}',
                  variant: AppTextVariant.label,
                ),
                const SizedBox(height: AppSpacing.sm),
                AppText(product.name, variant: AppTextVariant.display),
                const SizedBox(height: AppSpacing.xs),
                AppText(
                  PriceFormatter.usd(product.priceUsd),
                  variant: AppTextVariant.headline,
                  color: AppColors.racingGreen,
                ),
                const SizedBox(height: AppSpacing.md),
                AppText(product.description),
                const SizedBox(height: AppSpacing.md),
                ProductSpecRow(label: 'Case', value: product.caseSpec),
                ProductSpecRow(label: 'Movement', value: product.movement),
                ProductSpecRow(
                  label: 'Power reserve',
                  value: product.powerReserve,
                ),
                ProductSpecRow(
                  label: 'Water resistance',
                  value: product.waterResistance,
                ),
                const SizedBox(height: AppSpacing.lg),
                AppButton(
                  label: AppStrings.bookViewing,
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text(AppStrings.viewingNoted)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
