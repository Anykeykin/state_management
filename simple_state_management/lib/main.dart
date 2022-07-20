import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/data/goods.dart';
import 'package:state/ui/page_goods.dart';

import 'business/goods_business.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Goods>(
      create: (_) => Goods(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PageGoods(),
      ),
    );
  }
}


