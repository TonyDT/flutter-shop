import 'package:flutter/material.dart';

class ToastUtils {
  static void showToast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 100,
        content: Text(
          message ?? "加载成功",
          textAlign: TextAlign.center,  // 文字居中
        ),

        duration: Duration(seconds: 5),
        // 可选：调整背景色、边距等
        backgroundColor: Colors.black87,
        behavior: SnackBarBehavior.floating, // 浮动样式更明显
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
    );
  }
}