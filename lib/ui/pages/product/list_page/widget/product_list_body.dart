import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/style.dart';
import 'package:flutter_blog/data/mock/product.dart';

import 'package:flutter_blog/ui/pages/product/list_page/product_list_view_model.dart';
import 'package:flutter_blog/ui/pages/product/list_page/widget/product_list_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductListBody extends ConsumerWidget {
  const ProductListBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductListModel? model = ref.watch(productListProvider);
    List<Product> productList = [];
    if (model != null) {
      productList = model.productList;
    }
    print("productList 크기 : ${productList.length}");
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: textTitle0("Trenta"),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: productList.length,
            (context, index) => ProductListItem(productList[index]),
          ),
        ),
      ],
    );
  }
}
