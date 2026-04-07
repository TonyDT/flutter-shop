import 'package:flutter/material.dart';

import '../../viewmodels/home.dart';

class HmSuggestion extends StatefulWidget {
  //热销推荐
  final SpecialRecommendation specialRecommendResult;
  HmSuggestion({super.key,required this.specialRecommendResult});

  @override
  State<HmSuggestion> createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {

  //取前三条
  List<GoodsItem> _getDisplayItems(){
    if(widget.specialRecommendResult.subTypes.isEmpty){
      return [];
    }
   return  widget.specialRecommendResult.subTypes.first.goodsItems.items.take(3).toList();
  }
  Widget _buildHeader(){
      return Row(
        children: [
          Text("特惠推荐",
              style: TextStyle(color: const Color.fromARGB(255, 86, 24, 20),
                  fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
          ),
          SizedBox(width: 10),
          Text("精选省攻略",style: TextStyle(color: const Color.fromARGB(255, 86, 24, 20),fontSize: 14)),
        ],
      );
  }
//左侧的结构
  Widget _buildLeft(){
      return Container(
        width: 100,
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: AssetImage("lib/assets/home_cmd_inner.png"),
          fit: BoxFit.cover,
          )
        ),
      );
    }



    List<Widget> _getChildrenList (){
      List<GoodsItem> list = _getDisplayItems();
      return List.generate(list.length, (int index) {
        // ✅ 用 Expanded 包裹每个子项，使其均分右侧剩余宽度
        return Expanded(
          child: Padding(
            // ✅ 添加水平间距，避免子项紧贴
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  // ✅ 用 AspectRatio 替代固定宽高，使图片随父容器自适应
                  child: AspectRatio(
                    aspectRatio: 100 / 140, // 保持原宽高比
                    child: Image.network(
                      list[index].picture,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stack) {
                        return Image.asset(
                          "lib/assets/home_cmd_inner.png",
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: Text(
                    "￥${list[index].price}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                    // ✅ 防止价格文本换行或溢出
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        );
      });
    }
  //完成渲染
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.all(12),
        alignment: Alignment.center,
        // height: 300,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage("lib/assets/home_cmd_sm.png"),
            fit: BoxFit.cover,
          )
        ),
        child: Column(
             children: [
               //顶部内容
               _buildHeader(),
               SizedBox(height: 10),
               Row(children:[_buildLeft(),
                 Expanded(child:
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: _getChildrenList(),
                   ))
               ]),
             ],
        )
      ),
    );
  }
}
