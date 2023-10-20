import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/product/list_page/product_list_page.dart';
import 'package:flutter_blog/ui/pages/product/main_page/main_page.dart';

class Move {
  static String mainPage = "/main";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.mainPage: (context) => const MainPage(),
  };
}
