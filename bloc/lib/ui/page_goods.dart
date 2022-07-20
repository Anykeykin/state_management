import 'dart:developer';

import 'package:blocer/ui/page_basket.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import '../business/goods_business.dart';
import '../data/goods.dart';
import '../main.dart';



class PageGoods extends StatefulWidget {
  @override
  State<PageGoods> createState() => _PageGoodsState();
}

class _PageGoodsState extends State<PageGoods> {
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
                        builder: (context) => PageBasket()
                    ),
                        (route) => false);
              },
              icon: Icon(Icons.shopping_basket)
          )
        ],
      ),
      body:StreamBuilder(
              initialData: bloc.goods,
              stream: bloc.getStream,
              builder: (context,snapshot) {
                if (snapshot.hasData) {
                  return Center(
                    child: ListView.builder(
                        padding: EdgeInsets.all(8),
                        itemCount: bloc.goods.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Container(
                              width: 25,
                              height: 25,
                              color: Color(bloc.goods[index]['color']),
                            ),
                            title: Text('${bloc.goods[index]['name']}'),
                            trailing: IconButton(
                                onPressed: () {
                                  bloc.addGoods(bloc.goods[index]['name']);
                                },
                                icon:Icon(Icons.add)
                            ),
                          );
                        }
                    ),
                  );
                } else {
                  return Text('В корзине нет товаров');
                }
              },
              )
    );
  }
}