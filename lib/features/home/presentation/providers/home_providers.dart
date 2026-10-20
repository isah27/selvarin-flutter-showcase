import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/local_product_repository.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import 'home_notifier.dart';
import 'home_state.dart';

final Provider<ProductRepository> productRepositoryProvider =
    Provider<ProductRepository>((Ref ref) => const LocalProductRepository());

final NotifierProvider<HomeNotifier, HomeState> homeProvider =
    NotifierProvider<HomeNotifier, HomeState>(HomeNotifier.new);

/// Filtered list, recomputed only when collection or query change.
final Provider<List<Product>> visibleProductsProvider = Provider<List<Product>>(
  (Ref ref) => ref.watch(homeProvider).visible,
);

final Provider<Product> featuredProductProvider = Provider<Product>(
  (Ref ref) => ref.watch(productRepositoryProvider).featured(),
);
