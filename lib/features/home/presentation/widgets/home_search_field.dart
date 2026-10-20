import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../providers/home_providers.dart';

class HomeSearchField extends ConsumerWidget {
  const HomeSearchField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // read, not watch: typing never rebuilds the field itself.
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      child: AppTextField(
        hint: AppStrings.searchHint,
        prefixIcon: Icons.search,
        onChanged: ref.read(homeProvider.notifier).search,
      ),
    );
  }
}
