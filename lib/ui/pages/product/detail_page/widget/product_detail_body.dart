import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/style.dart';
import 'package:flutter_blog/data/mock/product.dart';
import 'package:flutter_blog/ui/pages/product/detail_page/product_detail_view_model.dart';
import 'package:flutter_blog/ui/widgets/custom_outline_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailBody extends ConsumerWidget {
  const ProductDetailBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductDetailModel? model = ref.watch(productDetailProvider);
    if (model == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      Product product = model.product;
      return CustomScrollView(
        slivers: [
          _appbar(),
          _body(product),
        ],
      );
    }
  }

  SliverPadding _body(Product product) {
    return SliverPadding(
      padding: EdgeInsets.all(16.0), // 패딩 설정
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textTitle1("${product.title}"),
            textBody2("${product.subtitle}"),
            SizedBox(height: 10),
            textBody1(
              "${product.content}",
            ),
            SizedBox(height: 10),
            textTitle1("${product.price}원"),
            SizedBox(height: 10),
            if (product.isIceOnly)
              Row(
                children: [
                  Expanded(
                      child: CustomOutlineButton("ICED ONLY", kActiveColor1)),
                ],
              )
            else
              Row(
                children: [
                  Expanded(child: CustomOutlineButton("ICE", kActiveColor1)),
                  Expanded(child: CustomOutlineButton("HOT", kActiveColor2)),
                ],
              ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              color: Colors.grey[100],
              child: textBody3("${product.caution}"),
            ),
            SizedBox(height: 300),
          ],
        ),
      ),
    );
  }

  SliverAppBar _appbar() {
    return SliverAppBar(
      pinned: true,
      elevation: 0.0,
      actions: [Icon(CupertinoIcons.share), SizedBox(width: 16)],
      iconTheme: IconThemeData(
        color: Color(0XFF8F8F8F),
      ),
      expandedHeight: 300,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final bool isCollapsed = constraints.maxHeight <= 80;
          print("kToolbarHeight : $kToolbarHeight");
          print("constraints.maxHeight : ${constraints.maxHeight}");
          return FlexibleSpaceBar(
            title: isCollapsed
                ? Text(
                    '${product.title}',
                    style: TextStyle(color: Colors.white),
                  )
                : null,
          );
        },
      ),
    );
  }
}
