import 'package:flutter/material.dart';
import 'package:shop/pages/Cart/index.dart';
import 'package:shop/pages/Categroy/index.dart';
import 'package:shop/pages/Home/index.dart';
import 'package:shop/pages/My/index.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // 写一个底部导航栏
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: getStackChild()),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blueAccent,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: getBars(),
      ),
    );
  }

  List<BottomNavigationBarItem> getBars() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
      BottomNavigationBarItem(icon: Icon(Icons.category), label: '分类'),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: '购物车'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
    ];
  }

  List<Widget> getStackChild() {
    return [HomePage(), CategroyPage(), CartPage(), MyPage()];
  }
}
