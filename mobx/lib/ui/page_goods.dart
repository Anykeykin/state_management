import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobxer/business/state.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../data/goods.dart';
import '../main.dart';
import 'page_basket.dart';



class PageGoods extends StatefulWidget {
  @override
  State<PageGoods> createState() => _PageGoodsState();
}

class _PageGoodsState extends State<PageGoods> {
  final List dataGoods = DataGoods().loadGoods();
  final Goods goods = Goods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Магазин'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => PageBasket(goods.listGoods)
                    ),
                        (route) => false);
              },
              icon: Icon(Icons.shopping_basket)
          )
        ],
      ),
      body: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: dataGoods.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Container(
                    width: 25,
                    height: 25,
                    color: Color(dataGoods[index]['color']),
                  ),
                  title: Text('${dataGoods[index]['name']}'),
                  trailing: IconButton(
                      onPressed: () {
                        goods.addGoods(dataGoods[index]['name']);
                        print(dataGoods[index]['name']);
                        print(goods.listGoods);
                      },
                      icon:Icon(Icons.add)
                  ),
                );
              }
          )
    );
  }
}