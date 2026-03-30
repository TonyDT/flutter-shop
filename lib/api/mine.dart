import 'package:myapp/viewmodels/home.dart';

import '../constants/index.dart';
import '../utils/DioRequest.dart';
//猜你喜欢有参数
//page:1 pageSize:20
Future<GoodsDetailsItems> getGuessListApi (Map<String, dynamic> params) async{
  return  GoodsDetailsItems.formJson( await dioRequest.get(HttpConstants.GUESS_LIST,params: params));
}