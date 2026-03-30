import 'package:flutter/material.dart';

class HomeHotRecommend extends StatefulWidget {
  HomeHotRecommend({Key? key}) : super(key: key);

  @override
  _HomeHotRecommendState createState() => _HomeHotRecommendState();
}

class _HomeHotRecommendState extends State<HomeHotRecommend> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 200,
      decoration: BoxDecoration(color: Colors.blue),
      child: Text('爆款推荐', style: TextStyle(color: Colors.white)),
    );
  }
}
