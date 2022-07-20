import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../business/state.dart';
import '../data/goods.dart';
import 'page_goods.dart';

class PageBasket extends StatelessWidget {
  final Goods goods = Goods();
  final List listgoods;
  PageBasket(this.listgoods);
  @override
  Widget build(BuildContext context) {
    print(goods.listGoods);
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
        body: Observer(
          builder: (_) {
            return ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: listgoods.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('${listgoods[index]}'),
                    trailing: IconButton(
                        onPressed: () {
                          // goods.addGoods(goods.listGoods[index]);
                          listgoods.remove(listgoods[index]);
                        },
                        icon: Icon(Icons.delete)),
                  );
                });
          },
        ));
  }
}
