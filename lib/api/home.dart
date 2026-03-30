//封装一个api 目的是返回业务侧需要的数据结构
import 'package:myapp/viewmodels/home.dart';

import '../constants/index.dart';
import '../utils/DioRequest.dart';

// Future<List<BannerItem>> getBannerListApi() async{
//   return ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((
//   item,
//   ) {return BannerItem.fromJson(item as Map<String, dynamic>);}).toList();
// }
Future<List<BannerItem>> getBannerListApi() async {
  // 第一步：获取API响应
  final response = await dioRequest.get(HttpConstants.BANNER_LIST);
  // 第二步：将响应转换为List
  List responseList = response as List;
  // 第三步：遍历List，逐个转换为BannerItem对象
  List<BannerItem> bannerList = [];
  for (var item in responseList) {
    BannerItem bannerItem = BannerItem.formJson(item);
    bannerList.add(bannerItem);
  }
  // 第四步：返回结果
  return bannerList;
}


//获取分类列表
Future<List<CategoryItem>> getCategoryListApi() async {
  final response = await dioRequest.get(HttpConstants.CATEGORY_LIST);
  List responseList = response as List;
  List<CategoryItem> categoryList = [];
  for (var item in responseList) {
    CategoryItem categoryItem = CategoryItem.formJson(item);
    categoryList.add(categoryItem);
  }
  return categoryList;
}

//特惠推荐
Future<SpecialRecommendation> getProductListApi() async {
  return SpecialRecommendation.formJson(
      await dioRequest.get(HttpConstants.PRODUCT_LIST)
  );
}
// 热榜推荐
Future<SpecialRecommendation> getInVogueListAPI() async {
  // 返回请求
  return SpecialRecommendation.formJson(
    await dioRequest.get(HttpConstants.IN_VOGUE_LIST),
  );
}

// 一站式推荐
Future<SpecialRecommendation> getOneStopListAPI() async {
  // 返回请求
  return SpecialRecommendation.formJson(
    await dioRequest.get(HttpConstants.ONE_STOP_LIST),
  );
}
