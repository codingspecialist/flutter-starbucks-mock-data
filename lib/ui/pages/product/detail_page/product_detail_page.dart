import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/ui/pages/product/detail_page/widget/product_detail_body.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductDetailBody(),
      persistentFooterButtons: [
        _bottomButton(),
      ],
      extendBody: false, // body가 하단 버튼을 가리지 않게 하기
    );
  }

  Widget _bottomButton() {
    return Column(
      children: [
        Container(
          height: 1,
          color: Colors.black26,
        ),
        SizedBox(
          height: 10,
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: kAccentColor,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          onPressed: () {},
          child: Text(
            "주문하기",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
