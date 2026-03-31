
import 'package:myapp/viewmodels/user.dart';

import '../constants/index.dart';
import '../utils/DioRequest.dart';

Future<UserInfo>loginAPI(Map<String,dynamic> params) async{
  return UserInfo.fromJSON(
      await dioRequest.post(HttpConstants.LOGIN,params: params)
  );
}