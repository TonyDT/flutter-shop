

//每一个轮播具体类型
class BannerItem{

  String id;
  String imgUrl;
  BannerItem({required this.id, required this.imgUrl});
  //扩展一个工厂函数一般用factory来声明 一般用来创建实例对象
  factory BannerItem.fromJson(Map<String,dynamic> json) {
    return BannerItem(
      id: json["id"] ?? "",
      imgUrl: json["imgUrl"] ?? "",
    );
  }
}


// {
// "id": "1181622001",
// "name": "气质女装",
// "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/qznz.png",
// "children": [
// {
// "id": "1191110001",
// "name": "半裙",
// "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_bq.png?quality=95&imageView",
// "children": null,
// "goods": null
// },
// {
// "id": "1191110002",
// "name": "衬衫",
// "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_cs.png?quality=95&imageView",
// "children": null,
// "goods": null
// },
// {
// "id": "1191110022",
// "name": "T恤",
// "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_tx.png?quality=95&imageView",
// "children": null,
// "goods": null
// },
// {
// "id": "1191110023",
// "name": "针织衫",
// "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_zzs.png?quality=95&imageView",
// "children": null,
// "goods": null
// },
// {
// "id": "1191110024",
// "name": "夹克",
// "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_jk.png?quality=95&imageView",
// "children": null,
// "goods": null
// },
// {
// "id": "1191110025",
// "name": "卫衣",
// "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_wy.png?quality=95&imageView",
// "children": null,
// "goods": null
// },
// {
// "id": "1191110028",
// "name": "背心",
// "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_bx.png?quality=95&imageView",
// "children": null,
// "goods": null
// }
// ],
// "goods": null
// }
//分类项
class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;
  dynamic goods;

  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
    this.goods,
  });

  //工厂函数，从JSON创建实例
  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      picture: json["picture"] ?? "",
      children: json["children"] != null
          ? (json["children"] as List)
              .map((e) => CategoryItem.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      goods: json["goods"],
    );
  }
}

