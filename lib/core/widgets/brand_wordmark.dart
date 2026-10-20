import 'package:flutter/widgets.dart';

import '../constants/app_strings.dart';
import 'app_text.dart';

class BrandWordmark extends StatelessWidget {
  const BrandWordmark({this.color, super.key});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppText(
      AppStrings.brand,
      variant: AppTextVariant.wordmark,
      color: color,
    );
  }
}
