import 'package:flutter/material.dart';

class ToastUtils {
  static bool showLoading = false;
  static void showToast(BuildContext context, String message) {
    if(ToastUtils.showLoading){
      return;
    }
    ToastUtils.showLoading = true;
    Future.delayed(Duration(seconds: 3),(){
      ToastUtils.showLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 180,
        content: Text(
          message ?? "加载成功",
          textAlign: TextAlign.center,  // 文字居中
        ),

        duration: Duration(seconds: 3),
        // 可选：调整背景色、边距等
        backgroundColor: Colors.black87,
        behavior: SnackBarBehavior.floating, // 浮动样式更明显
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
    );
  }
}