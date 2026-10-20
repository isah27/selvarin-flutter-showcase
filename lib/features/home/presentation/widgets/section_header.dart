import 'package:flutter/widgets.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_text.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.sm,
        AppSpacing.lg,
        AppSpacing.md,
      ),
      child: AppText(title, variant: AppTextVariant.headline),
    );
  }
}
