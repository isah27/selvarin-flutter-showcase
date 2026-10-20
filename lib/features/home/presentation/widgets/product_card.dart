import 'package:flutter/material.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_durations.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/image_cache_size.dart';
import '../../../../core/utils/price_formatter.dart';
import '../../../../core/utils/sized_asset_image.dart';
import '../../../../core/widgets/app_text.dart';
import '../../domain/entities/product.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({required this.product, super.key});

  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _pressed = false;

  void _setPressed(bool value) {
    if (value != _pressed) {
      setState(() => _pressed = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Product product = widget.product;
    return GestureDetector(
      onTapDown: (_) => _setPressed(true),
      onTapCancel: () => _setPressed(false),
      onTapUp: (_) => _setPressed(false),
      onTap: () =>
          Navigator.of(context)
              .pushNamed(AppRoutes.productDetail, arguments: product),
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1,
        duration: AppDurations.fast,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints box) => Hero(
                  tag: product.id,
                  child: ClipRRect(
                    borderRadius: AppRadii.card,
                    child: ColoredBox(
                      color: AppColors.stone,
                      child: Image(
                        image: SizedAssetImage.of(
                          product.image,
                          ImageCacheSize.forExtent(context, box.maxWidth),
                        ),
                        width: box.maxWidth,
                        height: box.maxHeight,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            AppText(
              product.collection.label.toUpperCase(),
              variant: AppTextVariant.label,
            ),
            const SizedBox(height: AppSpacing.xxs),
            AppText(product.name, variant: AppTextVariant.title, maxLines: 1),
            AppText(
              PriceFormatter.usd(product.priceUsd),
              variant: AppTextVariant.caption,
            ),
          ],
        ),
      ),
    );
  }
}
