import 'package:flutter/material.dart';
import 'package:myapp/components/Home/HmCategory.dart';
import 'package:myapp/components/Home/HmHot.dart';
import 'package:myapp/components/Home/HmMoreList.dart';
import 'package:myapp/components/Home/HmSlider.dart';
import 'package:myapp/components/Home/HmSuggestion.dart';
import 'package:myapp/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  List<BannerItem> _bannerList = [
    BannerItem(id: "1", imgUrl: "https://cbu01.alicdn.com/img/ibank/O1CN01hARknf20TLsaIVq6M_!!3821586850-0-cib.400x400.jpg"),
    BannerItem(id: "2", imgUrl: "https://cbu01.alicdn.com/img/ibank/O1CN01ZbGcny1I21HdHdG0p_!!3882110834-0-cib.jpg"),
    BannerItem(id: "3", imgUrl: "https://cbu01.alicdn.com/img/ibank/O1CN01ssuywC1j72zPfy4Mt_!!1001514500-0-cib.jpg"),
  ];
  List<Widget>_getScrollChildren(){
    return[
      //包裹普通的wiget的sliver家族
      SliverToBoxAdapter(child: HmSlider(bannerList: _bannerList,)),//轮播图
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
