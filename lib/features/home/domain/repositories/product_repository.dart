import '../entities/product.dart';

abstract interface class ProductRepository {
  List<Product> products();

  Product featured();
}
