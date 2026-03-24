import 'package:flutter/material.dart';
import 'package:myapp/components/Home/HmCategory.dart';
import 'package:myapp/components/Home/HmHot.dart';
import 'package:myapp/components/Home/HmMoreList.dart';
import 'package:myapp/components/Home/HmSlider.dart';
import 'package:myapp/components/Home/HmSuggestion.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget>_getScrollChildren(){
    return[
      //包裹普通的wiget的sliver家族
      SliverToBoxAdapter(child: HmSlider()),//轮播图
      SliverToBoxAdapter(child: SizedBox(height: 10)),//放置分类组件

      //SliverGrid SliverLsit  只能纵向排列只能用ListView
      SliverToBoxAdapter(child: HmCategory()),//分类组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),

      SliverToBoxAdapter(child: HmSuggestion()),//分类组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
        child:  Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(child: HmHot()),
          SizedBox(width: 10,),
          Expanded(child: HmHot()),
        ],
      ),),
     ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      HmMoreList()//无限滚动列表
    ];
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(  //sliver家族的内容
      slivers: _getScrollChildren(),
    );
  }
}
