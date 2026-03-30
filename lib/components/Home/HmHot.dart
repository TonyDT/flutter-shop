import 'package:flutter/material.dart';

import '../../viewmodels/home.dart';

class HmHot extends StatefulWidget {
  // 热榜推荐
  final SpecialRecommendation result;
  // 类型
  final String type;
  //热门组件
  const HmHot({super.key,required this.result, required this.type});

  @override
  State<HmHot> createState() => _HmHotState();
}

class _HmHotState extends State<HmHot> {
  // 获取前两条数据
  List<GoodsItem> get _items {
    if (widget.result.subTypes.isEmpty) {
      return [];
    }
    return widget.result.subTypes.first.goodsItems.items.take(2).toList();
  }

  // 构建子项
  List<Widget> _getChildrenList() {
    return _items.map((item) {
      return Expanded( child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),//添加间距
        // width: 80,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
        child: AspectRatio(  // 使用 AspectRatio 保持比例，避免固定宽高
          aspectRatio: 0.8,
              child: Image.network(
                item.picture,
                fit: BoxFit.cover,
                // width: 80,
                // height: 100,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "lib/assets/home_cmd_inner.png",
                    fit: BoxFit.cover,
                    // width: 80,
                    // height: 100,
                  );
                },
              ),
            ),
            ),
            SizedBox(height: 5),
            Text(
              "¥${item.price}",
              style: TextStyle(
                fontSize: 12,
                color: const Color.fromARGB(255, 86, 24, 20),
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
      );
    }).toList();
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          widget.type == "step" ? "一站买全" : "爆款推荐",
          style: TextStyle(
            color: const Color.fromARGB(255, 86, 24, 20),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 10),
        Text(
          widget.type == "step" ? "精心优选" : "最受欢迎",
          style: TextStyle(
            fontSize: 12,
            color: const Color.fromARGB(255, 124, 63, 58),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: widget.type == "step"
              ? const Color.fromARGB(255, 249, 247, 219)
              : const Color.fromARGB(255, 211, 228, 240),
        ),
        child: Column(
          children: [
            // 顶部内容
            _buildHeader(),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _getChildrenList(),
            ),
          ],
        ),
      ),
    );
  }
}