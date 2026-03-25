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
    BannerItem bannerItem = BannerItem.fromJson(item);
    bannerList.add(bannerItem);
  }
  // 第四步：返回结果
  return bannerList;
}