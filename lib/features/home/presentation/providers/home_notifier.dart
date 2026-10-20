import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/watch_collection.dart';
import 'home_providers.dart';
import 'home_state.dart';

class HomeNotifier extends Notifier<HomeState> {
  @override
  HomeState build() =>
      HomeState(products: ref.watch(productRepositoryProvider).products());

  void selectCollection(WatchCollection collection) {
    if (collection != state.collection) {
      state = state.copyWith(collection: collection);
    }
  }

  void search(String query) {
    final String trimmed = query.trim();
    if (trimmed != state.query) {
      state = state.copyWith(query: trimmed);
    }
  }
}
