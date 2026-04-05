import 'package:flutter/material.dart';
import 'package:shop/apis/Banner.dart';
import 'package:shop/types/HomeBannerTypes.dart';

import 'components/home_banner.dart';
import 'components/home_category.dart';
import 'components/home_hot_recommend.dart';
import 'components/home_product_list.dart';
import 'components/home_special_offer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CustomScrollView(slivers: getSlivers())),
    );
  }

  List<HomeBannerTypes> _bannerList = [];
  List<HomeCategoryTypes> _categoryList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBannerList();
    getCategoryList();
  }

  Future<void> getBannerList() async {
    List<HomeBannerTypes> bannerList = await getBannerListAsync();
    if (!mounted) return;
    setState(() {
      _bannerList = bannerList;
    });
  }

  Future<void> getCategoryList() async {
    List<HomeCategoryTypes> categoryList = await getCategoryListAsync();
    if (!mounted) return;
    setState(() {
      _categoryList = categoryList;
    });
  }

  List<Widget> getSlivers() {
    return [
      SliverToBoxAdapter(child: HomeBanner(bannerList: _bannerList)), // 轮播图
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: HomeCategory(categoryList: _categoryList),
      ), // 分类
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HomeSpecialOffer()), // 特惠推荐
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // const HomeHotRecommend(), // 热门推荐
      SliverToBoxAdapter(
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(child: HomeHotRecommend()),
            Container(height: 10, margin: EdgeInsets.symmetric(horizontal: 5)),
            Expanded(child: HomeHotRecommend()),
          ],
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      const HomeProductList(), // 商品列表
    ];
  }
}
