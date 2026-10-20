import 'package:flutter/widgets.dart';

import '../../../../core/theme/app_sizes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../domain/entities/watch_collection.dart';
import 'collection_chip.dart';

class CollectionChips extends StatelessWidget {
  const CollectionChips({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.chipHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        itemCount: WatchCollection.values.length,
        separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.sm),
        itemBuilder: (_, int i) => CollectionChip(
          key: ValueKey<WatchCollection>(WatchCollection.values[i]),
          collection: WatchCollection.values[i],
        ),
      ),
    );
  }
}
