import 'package:flutter/foundation.dart';

import '../../domain/entities/product.dart';
import '../../domain/entities/watch_collection.dart';

@immutable
class HomeState {
  const HomeState({
    required this.products,
    this.collection = WatchCollection.all,
    this.query = '',
  });

  final List<Product> products;
  final WatchCollection collection;
  final String query;

  List<Product> get visible => products
      .where(
        (Product p) =>
            (collection == WatchCollection.all || p.collection == collection) &&
            p.matches(query),
      )
      .toList(growable: false);

  HomeState copyWith({WatchCollection? collection, String? query}) => HomeState(
    products: products,
    collection: collection ?? this.collection,
    query: query ?? this.query,
  );
}
