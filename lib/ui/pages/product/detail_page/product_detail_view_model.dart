// 1. 창고 데이터
import 'package:flutter_blog/data/mock/product.dart';

import 'package:flutter_blog/data/repository/product_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailModel {
  Product product;
  ProductDetailModel(this.product);
}

// 2. 창고
class ProductDetailViewModel extends StateNotifier<ProductDetailModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;
  ProductDetailViewModel(this.ref, super.state);

  Future<void> notifyInit() async {
    Product product = await ProductRepository().fetchProductDetail();
    state = ProductDetailModel(product);
  }
}

// 3. 창고 관리자
final productDetailProvider = StateNotifierProvider.autoDispose<
    ProductDetailViewModel, ProductDetailModel?>((ref) {
  return ProductDetailViewModel(ref, null)..notifyInit();
});
