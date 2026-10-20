import '../../../../core/constants/app_assets.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/watch_collection.dart';
import '../../domain/repositories/product_repository.dart';

/// Fictional catalogue. Names, specs and prices are invented for the demo.
class LocalProductRepository implements ProductRepository {
  const LocalProductRepository();

  @override
  List<Product> products() => _catalogue;

  @override
  Product featured() => _catalogue[4];

  static final List<Product> _catalogue = <Product>[
    Product(
      id: 'verde-39',
      name: 'Verde Sunburst 39',
      reference: 'SV-3901',
      collection: WatchCollection.sport,
      priceUsd: 8400,
      image: AppAssets.product(1),
      caseSpec: '39 mm brushed steel, integrated bracelet',
      movement: 'Automatic calibre S-21',
      powerReserve: '70 hours',
      waterResistance: '100 m',
      description:
          'A racing-green sunburst dial on a slim integrated bracelet. '
          'The everyday SELVARIN.',
    ),
    Product(
      id: 'alba-38',
      name: 'Alba Dress 38',
      reference: 'SA-3802',
      collection: WatchCollection.dress,
      priceUsd: 6200,
      image: AppAssets.product(2),
      caseSpec: '38 mm polished steel, 8.4 mm thin',
      movement: 'Hand-wound calibre S-07',
      powerReserve: '48 hours',
      waterResistance: '30 m',
      description:
          'An ivory grained dial, leaf hands and a forest calfskin strap.',
    ),
    Product(
      id: 'rose-37',
      name: 'Rosa Petite Seconde',
      reference: 'SR-3703',
      collection: WatchCollection.heritage,
      priceUsd: 7900,
      image: AppAssets.product(3),
      caseSpec: '37 mm polished steel',
      movement: 'Hand-wound calibre S-09',
      powerReserve: '52 hours',
      waterResistance: '30 m',
      description:
          'A salmon dial with small seconds at six and blued steel hands.',
    ),
    Product(
      id: 'ardesia-42',
      name: 'Ardesia Diver 42',
      reference: 'SD-4204',
      collection: WatchCollection.sport,
      priceUsd: 5600,
      image: AppAssets.product(4),
      caseSpec: '42 mm grade 5 titanium, ceramic bezel',
      movement: 'Automatic calibre S-30',
      powerReserve: '72 hours',
      waterResistance: '300 m',
      description: 'Slate dial, bold lume and a rubber strap. Built to dive.',
    ),
    const Product(
      id: 'notte-40',
      name: 'Notte Verde 40',
      reference: 'SN-4005',
      collection: WatchCollection.heritage,
      priceUsd: 9800,
      image: AppAssets.featured,
      caseSpec: '40 mm steel, sapphire crystal',
      movement: 'Automatic calibre S-21',
      powerReserve: '70 hours',
      waterResistance: '50 m',
      description:
          'Our deepest green sunburst, shot after dark. A limited series.',
    ),
    Product(
      id: 'travertino-38',
      name: 'Travertino 38',
      reference: 'ST-3806',
      collection: WatchCollection.dress,
      priceUsd: 6900,
      image: AppAssets.product(6),
      caseSpec: '38 mm steel, onion crown',
      movement: 'Hand-wound calibre S-07',
      powerReserve: '48 hours',
      waterResistance: '30 m',
      description:
          'A cream dial and a green strap, made for long dinners and '
          'longer weekends.',
    ),
  ];
}
