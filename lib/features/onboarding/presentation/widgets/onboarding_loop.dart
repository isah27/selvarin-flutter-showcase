import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/image_cache_size.dart';
import '../../../../core/utils/sized_asset_image.dart';

/// Looping brand film (animated WebP). Off-screen pages get
/// `TickerMode(enabled: false)`, which pauses the animation, and the loop
/// paints on its own layer so frames never repaint the copy below.
class OnboardingLoop extends StatelessWidget {
  const OnboardingLoop({
    required this.asset,
    required this.height,
    required this.active,
    super.key,
  });

  final String asset;
  final double height;
  final bool active;

  static const List<Color> _fade = <Color>[
    AppColors.transparent,
    AppColors.alabaster,
  ];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return RepaintBoundary(
      child: TickerMode(
        enabled: active,
        child: SizedBox(
          height: height,
          width: width,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image(
                image: SizedAssetImage.of(
                  asset,
                  ImageCacheSize.forExtent(context, width),
                ),
                fit: BoxFit.cover,
                gaplessPlayback: true,
              ),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0, 0.45),
                    end: Alignment.bottomCenter,
                    colors: _fade,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
