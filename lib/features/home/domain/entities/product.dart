import 'package:flutter/foundation.dart';

import 'watch_collection.dart';

@immutable
class Product {
  const Product({
    required this.id,
    required this.name,
    required this.reference,
    required this.collection,
    required this.priceUsd,
    required this.image,
    required this.caseSpec,
    required this.movement,
    required this.powerReserve,
    required this.waterResistance,
    required this.description,
  });

  final String id;
  final String name;
  final String reference;
  final WatchCollection collection;
  final int priceUsd;
  final String image;
  final String caseSpec;
  final String movement;
  final String powerReserve;
  final String waterResistance;
  final String description;

  bool matches(String query) {
    if (query.isEmpty) {
      return true;
    }
    final String q = query.toLowerCase();
    return name.toLowerCase().contains(q) ||
        reference.toLowerCase().contains(q) ||
        collection.label.toLowerCase().contains(q);
  }
}
