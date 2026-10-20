import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:selvarin/features/home/domain/entities/product.dart';
import 'package:selvarin/features/home/domain/entities/watch_collection.dart';
import 'package:selvarin/features/home/presentation/providers/home_providers.dart';

void main() {
  late ProviderContainer container;

  setUp(() => container = ProviderContainer());
  tearDown(() => container.dispose());

  List<Product> visible() => container.read(visibleProductsProvider);

  test('starts on All with the full catalogue', () {
    expect(container.read(homeProvider).collection, WatchCollection.all);
    expect(visible(), hasLength(6));
  });

  test('filters by collection', () {
    container
        .read(homeProvider.notifier)
        .selectCollection(WatchCollection.sport);
    expect(
      visible().every((Product p) => p.collection == WatchCollection.sport),
      isTrue,
    );
    expect(visible(), isNotEmpty);
  });

  test('search is case-insensitive and combines with collection', () {
    final HomeNotifierAccess n = HomeNotifierAccess(container);
    n.search('  ardesia ');
    expect(visible().single.id, 'ardesia-42');
    n.select(WatchCollection.dress);
    expect(visible(), isEmpty);
  });
}

/// Small helper so the test reads like the UI calls.
class HomeNotifierAccess {
  HomeNotifierAccess(this.container);

  final ProviderContainer container;

  void search(String q) => container.read(homeProvider.notifier).search(q);

  void select(WatchCollection c) =>
      container.read(homeProvider.notifier).selectCollection(c);
}
