import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_sizes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/image_cache_size.dart';
import '../../../../core/utils/sized_asset_image.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text.dart';
import '../../domain/entities/product.dart';
import '../providers/home_providers.dart';

class FeaturedBanner extends ConsumerWidget {
  const FeaturedBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Product product = ref.watch(featuredProductProvider);
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.sm,
        AppSpacing.lg,
        AppSpacing.md,
      ),
      child: SizedBox(
        height: AppSizes.bannerHeight,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.forest,
            borderRadius: AppRadii.banner,
          ),
          child: ClipRRect(
            borderRadius: AppRadii.banner,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const AppText(
                          AppStrings.featuredEyebrow,
                          variant: AppTextVariant.label,
                          color: AppColors.salmon,
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        AppText(
                          product.name,
                          variant: AppTextVariant.headline,
                          color: AppColors.white,
                          maxLines: 2,
                        ),
                        const Spacer(),
                        AppButton(
                          label: AppStrings.featuredCta,
                          variant: AppButtonVariant.ghost,
                          foreground: AppColors.white,
                          expanded: false,
                          onPressed: () => Navigator.of(context).pushNamed(
                            AppRoutes.productDetail,
                            arguments: product,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Image(
                  image: SizedAssetImage.of(
                    product.image,
                    ImageCacheSize.forExtent(
                      context,
                      AppSizes.bannerImageWidth,
                    ),
                  ),
                  width: AppSizes.bannerImageWidth,
                  height: AppSizes.bannerHeight,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
