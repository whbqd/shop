// 轮播图数据
class HomeBannerTypes {
  String imageUrl;
  String id;
  HomeBannerTypes({required this.imageUrl, required this.id});

  factory HomeBannerTypes.fromJson(Map<String, dynamic> json) {
    return HomeBannerTypes(
      imageUrl: (json['imageUrl'] ?? json['imgUrl'] ?? '').toString(),
      id: (json['id'] ?? '').toString(),
    );
  }

  @override
  String toString() {
    return 'HomeBannerTypes(id: $id, imageUrl: $imageUrl)';
  }
}

// 分类数据
class HomeCategoryTypes {
  String name;
  String picture;
  String id;
  List<HomeCategoryTypes>? children;
  HomeCategoryTypes({
    required this.name,
    required this.picture,
    required this.id,
    this.children,
  });
  factory HomeCategoryTypes.fromJson(Map<String, dynamic> json) {
    return HomeCategoryTypes(
      name: (json['name'] ?? '').toString(),
      picture: (json['picture'] ?? '').toString(),
      id: (json['id'] ?? '').toString(),
      children: json['children'] != null
          ? (json['children'] as List)
                .map((item) => HomeCategoryTypes.fromJson(item))
                .toList()
          : null,
    );
  }
  @override
  String toString() {
    return 'HomeCategoryTypes(id: $id, name: $name, picture: $picture, children: $children)';
  }
}
