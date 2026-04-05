import 'package:flutter/material.dart';
import 'package:shop/types/HomeBannerTypes.dart';

class HomeCategory extends StatefulWidget {
  final List<HomeCategoryTypes> categoryList;
  HomeCategory({Key? key, required this.categoryList}) : super(key: key);

  @override
  _HomeCategoryState createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categoryList.length,
        itemBuilder: (context, index) {
          final category = widget.categoryList[index];
          return GestureDetector(
            onTap: () {
              // 点击事件
              print(category);
            },
            child: Container(
              width: 85,
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color.fromARGB(74, 33, 149, 243),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    width: 50,
                    height: 50,
                    category.picture,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    category.name,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 54, 54, 54),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
