import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpoder/ui/page_basket.dart';

import '../business/goods_business.dart';
import '../data/goods.dart';
import '../main.dart';



class PageGoods extends HookConsumerWidget {
  final goods = AllGoods().loadedGoods();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goodsList = ref.watch(addGoodsProvider);
    final provider = ref.read(addGoodsProvider.notifier);
    print('build');
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
                      provider.increment(goods[index]['name']);
                      print(goodsList);
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