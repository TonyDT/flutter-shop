import 'package:flutter/material.dart';
import 'package:myapp/pages/Cart/index.dart';
import 'package:myapp/pages/Category/index.dart';
import 'package:myapp/pages/Home/index.dart';
import 'package:myapp/pages/Mine/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //定义数据根据数据进行渲染4个导航
  //一般应用程序导航是固定的额
  final List<Map<String,String>> _tabList = [
    {
    "icon":"lib/assets/home_n.png",
    "active_icon":"lib/assets/home_a.png",
    "text":"首页",
     },
    {
    "icon":"lib/assets/list_n.png",
    "active_icon":"lib/assets/list_a.png",
    "text":"分类",
    },
    {
      "icon":"lib/assets/car_n.png",
      "active_icon":"lib/assets/car_a.png",
      "text":"购物车",
    },
    {
      "icon":"lib/assets/home_n.png",
      "active_icon":"lib/assets/home_a.png",
      "text":"我的",
    },

  ];
  int _currentIndex = 0;
  List<BottomNavigationBarItem>_getTabBarWidget(){
   return  List.generate(_tabList.length, (int index){
     return BottomNavigationBarItem(
       icon: Image.asset(_tabList[index]["icon"]!,width: 30,height: 30),
       activeIcon: Image.asset(_tabList[index]["active_icon"]!,width: 30,height: 30,),
       label: _tabList[index]["text"],
     );

   });
  }
  List<Widget>_getChildren () {
    return [HomeView(),CategoryView(),CartView(),MineView()];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      body: SafeArea(child:
        IndexedStack(
          index: _currentIndex,
          children: _getChildren(),//放置几个组件
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){
          _currentIndex = index;
          setState(() {});
        },
        items: _getTabBarWidget(),
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
      ),

    );
  }
}
