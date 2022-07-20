import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:reduxer/business/actions.dart';
import 'package:reduxer/business/app_state.dart';
import 'package:reduxer/ui/page_basket.dart';

import '../data/goods.dart';
import '../main.dart';



class PageGoods extends StatefulWidget {
  @override
  State<PageGoods> createState() => _PageGoodsState();
}

class _PageGoodsState extends State<PageGoods> {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Магазин'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => PageBasket()
                    ),
                        (route) => false);
              },
              icon: Icon(Icons.shopping_basket)
          )
        ],
      ),
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (BuildContext context, state) {
          return ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: state.goods.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Container(
                    width: 25,
                    height: 25,
                    color: Color(state.goods[index]['color']),
                  ),
                  title: Text('${state.goods[index]['name']}'),
                  trailing: IconButton(
                      onPressed: () {
                        // bloc.addGoods(bloc.goods[index]['name']);
                        store.dispatch(AddGoods(state.goods[index]['name']));
                      },
                      icon:Icon(Icons.add)
                  ),
                );
              }
          );
        },
      )
    );
  }
}