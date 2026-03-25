import 'package:flutter/material.dart';

import '../../viewmodels/home.dart';

class HmCategory extends StatefulWidget {
  //分类组件
  List<CategoryItem> categoryList = [];
  HmCategory({super.key,required this.categoryList});

  @override
  State<HmCategory> createState() => _HmCategoryState();
}

class _HmCategoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
        child:ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: widget.categoryList.length,
            itemBuilder: (BuildContext context,int index){
            //从widget中获取数据分类列表
              CategoryItem item = widget.categoryList[index];
              return Container(
                alignment: Alignment.center,
                width: 80,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12,
                ),
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(item.name,style: TextStyle(fontSize: 12,color: Colors.black)),
                    Image.network(item.picture,width: 50,height: 50),
                  ],
                ),
              );
            }
            ),
    );
  }
}
