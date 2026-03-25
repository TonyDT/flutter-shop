

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

//特惠推荐主类 - 对应最外层的 JSON 结构
class SpecialRecommendation {
  String id; //特惠推荐ID
  String title; //特惠推荐标题
  List<SubType> subTypes; //子类型列表（如"抢先尝鲜"、"新品预告"）

  SpecialRecommendation({
    required this.id,
    required this.title,
    required this.subTypes,
  });

  //工厂函数，从JSON创建实例
  factory SpecialRecommendation.fromJson(Map<String, dynamic> json) {
    return SpecialRecommendation(
      id: json["id"] ?? "",
      title: json["title"] ?? "",
      subTypes: (json["subTypes"] as List<dynamic>?)
              ?.map((e) => SubType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

//子类型类 - 对应 subTypes 数组中的每一项
class SubType {
  String id; //子类型ID
  String title; //子类型标题（如"抢先尝鲜"、"新品预告"）
  GoodsItems goodsItems; //商品数据容器

  SubType({
    required this.id,
    required this.title,
    required this.goodsItems,
  });

  //工厂函数，从JSON创建实例
  factory SubType.fromJson(Map<String, dynamic> json) {
    return SubType(
      id: json["id"] ?? "",
      title: json["title"] ?? "",
      goodsItems: GoodsItems.fromJson(json["goodsItems"] as Map<String, dynamic>? ?? {}),
    );
  }
}

//商品数据容器 - 对应 goodsItems 对象
class GoodsItems {
  int counts; //总商品数量
  int pageSize; //每页显示数量
  int pages; //总页数
  int page; //当前页码
  List<GoodsItem> items; //商品列表

  GoodsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });

  //工厂函数，从JSON创建实例
  factory GoodsItems.fromJson(Map<String, dynamic> json) {
    return GoodsItems(
      counts: json["counts"] ?? 0,
      pageSize: json["pageSize"] ?? 0,
      pages: json["pages"] ?? 0,
      page: json["page"] ?? 0,
      items: (json["items"] as List<dynamic>?)
              ?.map((e) => GoodsItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

//单个商品类 - 对应 items 数组中的每一个商品
class GoodsItem {
  String id; //商品ID
  String name; //商品名称
  String? desc; //商品描述（可为空）
  String price; //商品价格
  String picture; //商品图片URL
  int orderNum; //排序号

  GoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });

  //工厂函数，从JSON创建实例
  factory GoodsItem.fromJson(Map<String, dynamic> json) {
    return GoodsItem(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      desc: json["desc"],
      price: json["price"] ?? "0.00",
      picture: json["picture"] ?? "",
      orderNum: json["orderNum"] ?? 0,
    );
  }
}

