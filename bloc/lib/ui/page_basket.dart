import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import '../business/goods_business.dart';
import '../data/goods.dart';
import 'page_goods.dart';

class PageBasket extends StatefulWidget {
  @override
  State<PageBasket> createState() => _PageBasketState();
}

class _PageBasketState extends State<PageBasket> {

  @override
  Widget build(BuildContext context) {
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
      body: StreamBuilder(
          stream: bloc.getStream,
          initialData: bloc.goods,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: ListView.builder(
                    padding: EdgeInsets.all(8),
                    itemCount: bloc.listGoods.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text('${bloc.listGoods[index]}'),
                        trailing: IconButton(
                            onPressed: () {
                              bloc.removeGoods(bloc.listGoods[index]);
                            },
                            icon: Icon(Icons.delete)),
                      );
                    }),
              );
            } else {
              return Text('В корзине нет товаров');
            }
          })
    );
  }
}
