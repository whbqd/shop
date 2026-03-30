import 'package:flutter/material.dart';

class HomeCategory extends StatefulWidget {
  HomeCategory({Key? key}) : super(key: key);

  @override
  _HomeCategoryState createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            child: Text('分类$index', style: TextStyle(color: Colors.white)),
            width: 100,
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.blue),
          );
        },
      ),
    );
  }
}
