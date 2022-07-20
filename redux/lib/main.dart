import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:reduxer/business/app_state.dart';

import 'business/reducers.dart';
import 'data/goods.dart';
import 'ui/page_goods.dart';

void main() {
  final goods = GoodsList().loadGoods();
  final Store<AppState> store = Store(reducer, initialState: AppState(goods: goods,listGoods: []));
  runApp(StoreProvider(
      store: store,
      child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PageGoods(),
      );
  }
}


