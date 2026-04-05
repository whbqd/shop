import 'package:carousel_slider/carousel_slider.dart';
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
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  Widget getBanner() {
    final double width = MediaQuery.of(context).size.width;
    return CarouselSlider(
      carouselController: _carouselController,
      items: List.generate(widget.bannerList.length, (index) {
        return Image.network(
          widget.bannerList[index].imageUrl,
          width: width,
          fit: BoxFit.cover,
        );
      }),
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        initialPage: 0,
        onPageChanged: (index, reason) {
          setState(() {
            currentPage = index;
          });
        },
        viewportFraction: 1,
        autoPlayInterval: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(child: getBanner()),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.bannerList.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      currentPage = index;
                      _carouselController.animateToPage(index);
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: currentPage == index ? 45 : 15,
                    height: 12,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: currentPage == index
                            ? Color.fromARGB(208, 35, 35, 35)
                            : Colors.white,
                        width: 3,
                      ),
                      color: currentPage == index
                          ? const Color.fromARGB(208, 35, 35, 35)
                          : const Color.fromARGB(196, 255, 255, 255),
                      borderRadius: BorderRadius.circular(7.5),
                    ),
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
