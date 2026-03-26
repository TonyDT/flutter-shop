import 'package:flutter/material.dart';
import 'package:myapp/components/Home/HmCategory.dart';
import 'package:myapp/components/Home/HmHot.dart';
import 'package:myapp/components/Home/HmMoreList.dart';
import 'package:myapp/components/Home/HmSlider.dart';
import 'package:myapp/components/Home/HmSuggestion.dart';
import 'package:myapp/viewmodels/home.dart';

import '../../api/home.dart';
import '../../utils/DioRequest.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //热销推荐
  List<SpecialRecommendation> _SpecialRecommendationList = [];
//分类
  List<CategoryItem> _categoryList = [];

  //轮播图数据
  List<BannerItem> _bannerList = [
    // BannerItem(id: "1", imgUrl: "https://cbu01.alicdn.com/img/ibank/O1CN01hARknf20TLsaIVq6M_!!3821586850-0-cib.400x400.jpg"),
    // BannerItem(id: "2", imgUrl: "https://cbu01.alicdn.com/img/ibank/O1CN01ZbGcny1I21HdHdG0p_!!3882110834-0-cib.jpg"),
    // BannerItem(id: "3", imgUrl: "https://cbu01.alicdn.com/img/ibank/O1CN01ssuywC1j72zPfy4Mt_!!1001514500-0-cib.jpg"),
  ];
  List<Widget>_getScrollChildren(){
    return[
      //包裹普通的wiget的sliver家族
      SliverToBoxAdapter(child: HmSlider(bannerList: _bannerList,)),//轮播图
      SliverToBoxAdapter(child: SizedBox(height: 10)),//放置分类组件

      //SliverGrid SliverLsit  只能纵向排列只能用ListView
      SliverToBoxAdapter(child: HmCategory(categoryList: _categoryList,)),//分类组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),

      SliverToBoxAdapter(child: HmSuggestion(specialRecommendResult: _specialRecommendResult,)),//热销组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
        child:  Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: HmHot(result: _inVogueResult, type: "hot"),
          ),
          SizedBox(width: 10),
          Expanded(
            child: HmHot(result: _oneStopResult, type: "step"),
          ),
        ],
      ),),
     ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      HmMoreList(recommendList: _recommendList), // 无限滚动列表
    ];
  }
  // 特惠推荐
  SpecialRecommendation _specialRecommendResult = SpecialRecommendation(
      id: '',
      title: '',
      subTypes: [],
  );

// 热榜推荐
  SpecialRecommendation _inVogueResult = SpecialRecommendation(
    id: "",
    title: "",
    subTypes: [],
  );
  // 一站式推荐
  SpecialRecommendation _oneStopResult = SpecialRecommendation(
    id: "",
    title: "",
    subTypes: [],
  );

// 获取热榜推荐列表
  void _getInVogueList() async {
    _inVogueResult = await getInVogueListAPI();
    setState(() {});
  }

  // 获取一站式推荐列表
  void _getOneStopList() async {
    _oneStopResult = await getOneStopListAPI();
    setState(() {});
  }
  @override
  void initState() {
    super.initState();
    _getBannerList();
    _getCategoryList();
    _getProductList();
    _getInVogueList();
    _getOneStopList();
    _getRecommendList();
  }

  // 推荐列表
  List<GoodDetailItem> _recommendList = [];

  // 获取推荐列表
  void _getRecommendList() async {
    _recommendList = await getRecommendListAPI({"limit": 10});
    setState(() {});
  }

//特惠推荐列表
void _getProductList() async{
  _specialRecommendResult = await getProductListApi();
  setState(() {
  });
}


    //获取轮播图数据
  void _getBannerList() async{
    _bannerList = await getBannerListApi();
    // print(_bannerList);
    setState(() {
    });
  }
  //获取分类列表
  void _getCategoryList() async {
    _categoryList = await getCategoryListApi();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(  //sliver家族的内容
      slivers: _getScrollChildren(),
    );
  }
}
