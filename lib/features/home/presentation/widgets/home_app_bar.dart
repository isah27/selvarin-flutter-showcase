import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/brand_wordmark.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.md,
        AppSpacing.sm,
        AppSpacing.xs,
      ),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BrandWordmark(),
              SizedBox(height: AppSpacing.xxs),
              AppText('HAUTE HORLOGERIE', variant: AppTextVariant.caption),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.favorite_border, color: AppColors.graphite),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.shopping_bag_outlined, color: AppColors.graphite),
          ),
        ],
      ),
    );
  }
}
