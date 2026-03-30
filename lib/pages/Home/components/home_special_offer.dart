import 'package:flutter/material.dart';

class HomeSpecialOffer extends StatefulWidget {
  HomeSpecialOffer({Key? key}) : super(key: key);

  @override
  _HomeSpecialOfferState createState() => _HomeSpecialOfferState();
}

class _HomeSpecialOfferState extends State<HomeSpecialOffer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.blue),
      child: Text('特惠推荐', style: TextStyle(color: Colors.white)),
    );
  }
}
