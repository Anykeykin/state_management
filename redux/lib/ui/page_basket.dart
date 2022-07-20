import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:reduxer/business/actions.dart';

import '../business/app_state.dart';
import '../data/goods.dart';
import 'page_goods.dart';

class PageBasket extends StatefulWidget {
  @override
  State<PageBasket> createState() => _PageBasketState();
}

class _PageBasketState extends State<PageBasket> {

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Корзина'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => PageGoods()),
                        (route) => false);
              },
              icon: Icon(Icons.arrow_back))
        ],
      ),
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (BuildContext context, state) {
          return ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: state.listGoods.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('${state.listGoods[index]}'),
                  trailing: IconButton(
                      onPressed: () {
                        store.dispatch(RemoveGoods(state.listGoods[index]));
                      },
                      icon: Icon(Icons.delete)),
                );
              });
        },
      )
      ,
    );
  }
}
