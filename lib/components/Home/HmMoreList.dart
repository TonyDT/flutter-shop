import 'package:flutter/material.dart';

import '../../viewmodels/home.dart';

class HmMoreList extends StatefulWidget {
  // 推荐列表
  final List<GoodDetailItem> recommendList;
  const HmMoreList({super.key,required this.recommendList});

  @override
  State<HmMoreList> createState() => _HmMoreListState();
}

class _HmMoreListState extends State<HmMoreList> {
  Widget _getChildren(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: AspectRatio(
            aspectRatio: 1.0,
            child: Image.network(
              widget.recommendList[index].picture,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  "lib/assets/home_cmd_inner.png",
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
        SizedBox(height: 6),

        Text(
            widget.recommendList[index].name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black, fontSize: 10),
        ),
        SizedBox(height: 6),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 现价
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "¥${widget.recommendList[index].price}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              // 划线价（原价）
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "¥${widget.recommendList[index].price}",  // 如果有原价字段，换成 originalPrice
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              // 付款人数
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${widget.recommendList[index].payCount}人付款",
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ),
              ),
              // Expanded(
              //   child:
              //       Text.rich(
              //         TextSpan(
              //           text: "¥${widget.recommendList[index].price}",
              //           style: TextStyle(
              //             color: Colors.black,
              //             fontSize: 10,
              //             fontWeight: FontWeight.w800,
              //           ),
              //           children: [
              //             TextSpan(text: " "),
              //             TextSpan(
              //               text: "${widget.recommendList[index].price}",
              //               style: TextStyle(
              //                 decoration: TextDecoration.lineThrough,
              //                 color: Colors.grey,
              //                 fontSize: 10,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),

      //  Text(
      //   "${widget.recommendList[index].payCount}人付款",
      //   style: TextStyle(color: Colors.grey,fontSize: 10),
      //   maxLines: 1,
      //   overflow: TextOverflow.ellipsis,
      // ),

            ],
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // 必须是Sliver家族的组件
    return SliverGrid.builder(
      itemCount: widget.recommendList.length,
      gridDelegate:
      // 网格是两列
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: _getChildren(index),
        );
      },
    );
  }
}