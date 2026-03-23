//管理路由
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/Login/index.dart';
import 'package:myapp/pages/Main/index.dart';

//返回app跟级组件
Widget getRootWidget(){
  return  MaterialApp(
    //命名路由
    initialRoute: "/",
    routes: getRootRoutes(),
  );
}
//返回App路由配置
Map<String, Widget Function(BuildContext)> getRootRoutes(){
      return {
        "/":(context)=>MainPage(),//主页路由
        "/login":(context)=>LoginPage(),//登录路由

      };
}