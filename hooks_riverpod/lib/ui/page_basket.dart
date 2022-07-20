import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../business/goods_business.dart';
import '../data/goods.dart';
import 'page_goods.dart';

class PageBasket extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(addGoodsProvider.notifier);
    final goodsList = ref.watch(addGoodsProvider);
    print('build');
    print(goodsList);
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
      body: Consumer(builder: (context, ref, child) {
        final count = ref.watch(addGoodsProvider);
        return Center(
          child: goodsList.length == 0
              ? Text('В корзине нет товаров')
              : ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: count.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('${count[index]}'),
                      trailing: IconButton(
                          onPressed: () {
                            provider.delete(goodsList[index]);
                            print(goodsList);
                          },
                          icon: Icon(Icons.delete)),
                    );
                  }),
        );
      }

          // child: Center(
          //   child: goodsList.length == 0 ? Text('В корзине нет товаров')
          //       : ListView.builder(
          //       padding: EdgeInsets.all(8),
          //       itemCount: goodsList.length,
          //       itemBuilder: (BuildContext context, int index) {
          //         return ListTile(
          //           title: Text('${goodsList[index]}'),
          //           trailing: IconButton(
          //               onPressed: () {
          //                 provider.delete(goodsList[index]);
          //                 print(goodsList);
          //               },
          //               icon:Icon(Icons.delete)
          //           ),
          //         );
          //       }
          //   ),
          //
          // ),
          ),
    );
  }
}
