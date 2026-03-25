import 'package:flutter/material.dart';

import '../../viewmodels/home.dart';

class HmHot extends StatefulWidget {
  //热门组件
  HmHot({super.key});

  @override
  State<HmHot> createState() => _HmHotState();
}

class _HmHotState extends State<HmHot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
        alignment: Alignment.center,
        height: 200,
        child:Text("爆款推荐",style: TextStyle(color: Colors.white),),

    );
  }
}
