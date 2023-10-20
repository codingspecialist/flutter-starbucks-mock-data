// 1. 창고 데이터
import 'package:flutter_blog/data/mock/product.dart';
import 'package:flutter_blog/data/repository/product_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductListModel {
  List<Product> productList;
  ProductListModel(this.productList);
}

// 2. 창고
class ProductListViewModel extends StateNotifier<ProductListModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;
  ProductListViewModel(this.ref, super.state);

  Future<void> notifyInit() async {
    print("통신 시작");
    List<Product> productList = await ProductRepository().fetchProductList();
    print("통신 끝 ${productList.length}");
    state = ProductListModel(productList);
  }
}

// 3. 창고 관리자
final productListProvider =
    StateNotifierProvider.autoDispose<ProductListViewModel, ProductListModel?>(
        (ref) {
  return ProductListViewModel(ref, null)..notifyInit();
});
