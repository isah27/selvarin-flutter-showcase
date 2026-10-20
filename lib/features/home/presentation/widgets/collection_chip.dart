import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_durations.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_sizes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_text.dart';
import '../../domain/entities/watch_collection.dart';
import '../providers/home_providers.dart';
import '../providers/home_state.dart';

class CollectionChip extends ConsumerWidget {
  const CollectionChip({required this.collection, super.key});

  final WatchCollection collection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Only the chip that gains or loses selection rebuilds.
    final bool selected = ref.watch(
      homeProvider.select((HomeState s) => s.collection == collection),
    );
    return GestureDetector(
      onTap: () => ref.read(homeProvider.notifier).selectCollection(collection),
      child: AnimatedContainer(
        duration: AppDurations.medium,
        height: AppSizes.chipHeight,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.racingGreen : AppColors.surface,
          borderRadius: AppRadii.pill,
          border: Border.all(
            color: selected ? AppColors.racingGreen : AppColors.divider,
          ),
        ),
        child: AppText(
          collection.label,
          variant: AppTextVariant.title,
          color: selected ? AppColors.white : AppColors.graphite,
        ),
      ),
    );
  }
}
