import 'package:flutter/widgets.dart';

import '../../domain/entities/watch_collection.dart';

/// Hands-free tour of the shop for screen recordings
/// (only started when `DemoTour.enabled`).
class HomeTour {
  HomeTour({
    required this.scrollController,
    required this.onSelect,
    required this.onOpenProduct,
    required this.onCloseProduct,
    required this.isActive,
  });

  final ScrollController scrollController;
  final ValueChanged<WatchCollection> onSelect;
  final VoidCallback onOpenProduct;
  final VoidCallback onCloseProduct;
  final bool Function() isActive;

  Future<void> run() async {
    await _wait(3000);
    await _scrollTo(330, 4500);
    await _wait(1800);
    await _select(WatchCollection.sport, 2600);
    await _select(WatchCollection.dress, 2600);
    await _select(WatchCollection.all, 1600);
    await _scrollTo(double.infinity, 6500);
    await _wait(2000);
    await _scrollTo(0, 4000);
    await _wait(1200);
    if (!isActive()) {
      return;
    }
    onOpenProduct();
    await _wait(6500);
    if (isActive()) {
      onCloseProduct();
    }
  }

  Future<void> _wait(int ms) =>
      Future<void>.delayed(Duration(milliseconds: ms));

  Future<void> _select(WatchCollection collection, int dwellMs) async {
    if (!isActive()) {
      return;
    }
    onSelect(collection);
    await _wait(dwellMs);
  }

  Future<void> _scrollTo(double offset, int ms) async {
    if (!isActive() || !scrollController.hasClients) {
      return;
    }
    final double max = scrollController.position.maxScrollExtent;
    await scrollController.animateTo(
      offset.clamp(0, max),
      duration: Duration(milliseconds: ms),
      curve: Curves.easeInOutSine,
    );
  }
}
