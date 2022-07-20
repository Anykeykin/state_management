

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../business/goods_business.dart';
import '../data/goods.dart';
import 'page_goods.dart';

class PageBasket extends StatelessWidget {
  final List listGoods;

  PageBasket(this.listGoods);

  @override
  Widget build(BuildContext context) {
    print('build');
    print(listGoods);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Корзина'),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => PageGoods()
                    ),
                        (route) => false);
              },
              icon: Icon(Icons.arrow_back))
        ],
      ),
      body: Center(
        child: listGoods.length == 0 ? Text('В корзине нет товаров')
            : ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: listGoods.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('${listGoods[index]}'),
                trailing: IconButton(
                    onPressed: () {
                      context.read<Goods>().delete(listGoods[index]);
                    },
                    icon:Icon(Icons.delete)
                ),
              );
            }
        ),

      ),
    );
  }
}