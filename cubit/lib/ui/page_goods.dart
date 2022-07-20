import 'dart:developer';

import 'package:cubit/ui/page_basket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business/goods_business.dart';
import '../data/goods.dart';
import '../main.dart';



class PageGoods extends StatelessWidget {
  final goods = AllGoods().loadedGoods();

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
      body: Center(
        child: ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: goods.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Container(
                  width: 25,
                  height: 25,
                  color: Color(goods[index]['color']),
                ),
                title: Text('${goods[index]['name']}'),
                trailing: IconButton(
                    onPressed: () {
                      // provider.increment(goods[index]['name']);
                      // context.read<GoodsBloc>().mapEventToState(addBasketEvent(goods[index]['name']));
                      context.read<GoodsBloc>().increment(goods[index]['name']);
                      print(goods[index]['name']);
                    },
                    icon:Icon(Icons.add)
                ),
              );
            }
        ),

      ),
    );
  }
}