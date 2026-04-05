import 'package:shop/types/HomeBannerTypes.dart';
import 'package:shop/utils/request.dart';

testFetchJSON() async {
  final json = await requestUtils.get('/home/category/head');
  print(json);
}

// 轮播图数据
Future<List<HomeBannerTypes>> getBannerListAsync() async {
  return ((await requestUtils.get('/home/banner'))['result'] as List<dynamic>)
      .map((item) => HomeBannerTypes.fromJson(item))
      .toList();
}

// 获取分类数据
// /home/category/head
// HomeCategoryTypes 分类数据模型
Future<List<HomeCategoryTypes>> getCategoryListAsync() async {
  List<HomeCategoryTypes> categoryList =
      ((await requestUtils.get('/home/category/head'))['result']
              as List<dynamic>)
          .map((item) => HomeCategoryTypes.fromJson(item))
          .toList();
  return categoryList;
}
