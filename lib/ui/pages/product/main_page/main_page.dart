import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/product/list_page/product_list_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

// IndexedStack은 첫 페이지가 열릴 때, 나머지 ViewModel이 모두 작동하는 단점을 가진다. 아래 URL 참고
// https://getinthere.notion.site/15-IndexedStack-viewModel-08b29ba4fd84406381166bdce0ac57fc?pvs=4
class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color(0XFF8F8F8F),
        ),
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back),
        actions: [Icon(Icons.search), SizedBox(width: 16)],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Center(child: Text("HomePage")),
          Center(child: Text("PayPage")),
          ProductListPage(),
          Center(child: Text("ShopPage")),
          Center(child: Text("OtherPage")),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.grey[100],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.connected_tv_sharp),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.connected_tv_sharp),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.connected_tv_sharp),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.connected_tv_sharp),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.connected_tv_sharp),
            label: "",
          ),
        ],
      ),
    );
  }
}
