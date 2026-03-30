import 'package:flutter/material.dart';
import 'package:shop/Layout/index.dart';
import 'package:shop/pages/Login/index.dart';

class MyRoutes extends StatelessWidget {
  const MyRoutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: getRoutes());
  }
}

Map<String, WidgetBuilder> getRoutes() {
  return {'/': (context) => MainPage(), '/login': (context) => LoginPage()};
}
