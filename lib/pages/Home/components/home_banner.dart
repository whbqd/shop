import 'package:flutter/material.dart';
import 'package:shop/types/HomeBannerTypes.dart';

// 轮播图

class HomeBanner extends StatefulWidget {
  final List<HomeBannerTypes> bannerList;
  HomeBanner({Key? key, required this.bannerList}) : super(key: key);

  @override
  _HomeBannerState createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  getBanner() {}
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(child: getBanner()),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    currentPage = index;
                    _pageController.animateToPage(
                      index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  });
                },
                child: Container(
                  width: currentPage == index ? 45 : 15,
                  height: 12,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? const Color.fromARGB(186, 54, 54, 54)
                        : const Color.fromARGB(151, 255, 255, 255),
                    borderRadius: BorderRadius.circular(7.5),
                  ),
                ),
              ),
            ),
          ),
        ),
        // Positioned(
        //   child: TextField(decoration: InputDecoration(hintText: '搜索')),
        // ),
      ],
    );
  }
}
