import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/style.dart';
import 'package:flutter_blog/data/mock/product.dart';
import 'package:flutter_blog/ui/pages/product/detail_page/product_detail_page.dart';

class ProductListItem extends StatelessWidget {
  Product product;
  ProductListItem(
    this.product, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductDetailPage()));
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              foregroundImage: NetworkImage(
                "${product.pic}",
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textTitle2("${product.title}"),
                SizedBox(height: 3),
                textBody2("${product.subtitle}"),
                SizedBox(height: 5),
                textTitle2("${product.price}원"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
