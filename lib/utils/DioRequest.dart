//基于dio二次封装
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:myapp/constants/index.dart';

import '../viewmodels/home.dart';

class DioRequest {
    final _dio = Dio();//dio请求对象
    DioRequest() {
        //基础地质拦截器
      _dio.options
        ..baseUrl = GlobalConstants.BASE_URL
        ..connectTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
        ..sendTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
        ..receiveTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
        //拦截器
      _addInterceptor();
    }
    //添加拦截器
    void _addInterceptor() {
      _dio.interceptors.add(InterceptorsWrapper(
          onRequest:(request,handler){
                handler.next(request);
          },
          onResponse:(response,handler){
            //http状态码 200 300
                if(response.statusCode! >= 200 && response.statusCode! < 300)
                  {
                    handler.next(response);
                    return;
                  }
                handler.reject(DioException(requestOptions: response.requestOptions));
          },
          onError:(error,handler){
            // handler.reject(error);
            handler.reject(DioException(requestOptions: error.requestOptions,message: error.response?.data["msg"] ?? " "));
          }
      ));
    }
    Future<dynamic> get(String url,{Map<String,dynamic>? params}){
      return _handleResponse(_dio.get(url,queryParameters: params));
    }
    //定义post
    Future<dynamic> post(String url,{Map<String,dynamic>? params}){
      return _handleResponse(_dio.post(url,data: params));
    }
}
//进一步处理返回结果的函数
Future<dynamic> _handleResponse(Future<Response<dynamic>> task) async{
 try{
   Response<dynamic> res = await task;
   final data = res.data as Map<String,dynamic>;
   if(data["code"] == GlobalConstants.SUCCESS_CODE) {
     return data["result"];//返回结果
   }
   throw Exception(data["msg"] ?? "加载数据异常");
 }catch(e){
   // throw Exception(e);
   rethrow;
 }
}
//单例对象
final dioRequest = DioRequest();

//dio 请求工具发出请求 返回的数据 Response<dynamic>
//把所有的接口的data解放出来拿到真正的数据要判断业务状态码是不是等于1


// 推荐列表
Future<List<GoodDetailItem>> getRecommendListAPI(
    Map<String, dynamic> params,
    ) async {
  // 返回请求
  return ((await dioRequest.get(HttpConstants.RECOMMEND_LIST, params: params))
  as List)
      .map((item) {
    return GoodDetailItem.formJSON(item as Map<String, dynamic>);
  })
      .toList();
}
