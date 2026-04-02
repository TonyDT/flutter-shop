import 'package:myapp/constants/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
class TokenManager {
  //持久化对象的实例对象
  Future<SharedPreferences> _getInstance(){
    return SharedPreferences.getInstance();
  }
  //初始化token
  String _token = '';
  Future<void>init () async{
    final prefs = await  _getInstance();
    _token = prefs.getString(GlobalConstants.TOKEN_KEY) ?? "";
  }
  //设置token
  Future<void> setToken(String token) async{
    //1.获取持久化实例
   final prefs = await  _getInstance();
   //token写入到持久化 磁盘。
   prefs.setString(GlobalConstants.TOKEN_KEY, token);
   _token = token;
  }
  //获取token
  String  getToken(){
      return _token;
  }
  //删除token
  Future<void> removeToken () async{
    final prefs = await  _getInstance();
    //磁盘
    prefs.remove(GlobalConstants.TOKEN_KEY);
    _token = "";//内存
  }

}
final  tokenManager = TokenManager();
