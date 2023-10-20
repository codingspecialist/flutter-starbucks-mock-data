import 'package:flutter_blog/data/mock/product.dart';

class ProductRepository {
  Future<List<Product>> fetchProductList() {
    return Future.delayed(Duration(seconds: 3), () => productList);
  }

  Future<Product> fetchProductDetail() {
    return Future.delayed(Duration(seconds: 3), () => product);
  }
}
