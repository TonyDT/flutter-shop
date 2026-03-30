import 'package:flutter/material.dart';
import 'package:myapp/components/Home/HmCategory.dart';
import 'package:myapp/components/Home/HmHot.dart';
import 'package:myapp/components/Home/HmMoreList.dart';
import 'package:myapp/components/Home/HmSlider.dart';
import 'package:myapp/components/Home/HmSuggestion.dart';
import 'package:myapp/utils/ToastUtils.dart';
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
  Future<void> _getInVogueList() async {
    _inVogueResult = await getInVogueListAPI();
    // setState(() {});
  }

  // 获取一站式推荐列表
  Future<void> _getOneStopList() async {
    _oneStopResult = await getOneStopListAPI();
    // setState(() {});
  }
  @override
  void initState() {
    super.initState();
    // _getBannerList();
    // _getCategoryList();
    // _getProductList();
    // _getInVogueList();
    // _getOneStopList();
    // _getRecommendList();
    // 不能直接在这里调用，因为 RefreshIndicator 还未构建
    // _key.currentState?.show();  // 无效，currentState 为 null

    // 使用 microtask 延迟调用
    Future.microtask((){
      _paddingTop = 100;
      setState(() {

      });
      _key.currentState?.show();
    });

    _registerEvent();
  }

  //监听滚动到底部的事件
  void  _registerEvent(){
    _controller.addListener((){
      if(_controller.position.pixels >= (_controller.position.maxScrollExtent-50)){
        print("滚动到底部了");
        _getRecommendList();
      }
      });
  }


  // 推荐列表
  List<GoodDetailItem> _recommendList = [];

//  页码
  int _page = 1;
  bool _isLoading = false;//当前正在加载状态
  bool _hasMore = true;//是否还有更多数据

  // 获取推荐列表
  Future<void> _getRecommendList() async {
    //当已经有请求正在加载 或者已经没有下一页了，就放弃请求
    if(_isLoading || !_hasMore){
      return;
    }
    _isLoading = true;//占住位置
    int requestLimit = _page * 8;
    _recommendList = await getRecommendListAPI({"limit": requestLimit});
    _isLoading = false; //松开位置
    setState(() {});
    //如果返回的数据小于请求的数量，说明已经没有下一页了
    if(_recommendList.length < requestLimit){
      _hasMore = false;
      return;
    }

    _page++;
  }

//特惠推荐列表
  Future<void> _getProductList() async{
  _specialRecommendResult = await getProductListApi();
  // setState(() {
  // });
}


    //获取轮播图数据
  Future<void> _getBannerList() async{
    _bannerList = await getBannerListApi();
    // print(_bannerList);
  }
  //获取分类列表
  Future<void> _getCategoryList() async {
    _categoryList = await getCategoryListApi();
  }

  final _controller = ScrollController();



  Future<void> _onRefresh() async {
    print("下拉刷新");
    _page = 1;
    _isLoading= false;
    _hasMore = true;
    await _getBannerList();
    await _getCategoryList();
    await _getProductList();
    await _getInVogueList();
    await _getOneStopList();
    await _getRecommendList();

    print("刷新完成");
    ToastUtils.showToast(context, "刷新完成");
    _paddingTop = 0;
    setState(() {
    });
  }
  //Globalkey是一个方法可以创建一个key绑定到wiget部件上 可以操作wiget部件

  final GlobalKey<RefreshIndicatorState > _key = GlobalKey<RefreshIndicatorState>();

  double _paddingTop = 0;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _key,
      onRefresh: _onRefresh,
      child: AnimatedContainer(
        padding: EdgeInsets.only(top: _paddingTop),
        duration: Duration(milliseconds: 300),
        child: CustomScrollView(
          controller: _controller,
          slivers: _getScrollChildren(),
        ),
      ),
    );
  }
}

