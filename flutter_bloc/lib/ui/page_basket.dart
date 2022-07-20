import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business/goods_business.dart';
import '../data/goods.dart';
import 'page_goods.dart';

class PageBasket extends StatelessWidget {
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
      body: BlocBuilder<GoodsBloc,List>(
          builder: (BuildContext context,state) {
            print(state);
        return Center(
          child: state.length == 0
              ? Text('В корзине нет товаров')
              : ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: state.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('${state[index]}'),
                      trailing: IconButton(
                          onPressed: () {
                            // provider.delete(goodsList[index]);
                            // context.read<GoodsBloc>().mapEventToState(removeBasketEvent(state[index]));
                            context.read<GoodsBloc>().delete(state[index]);
                            print(state[index]);
                          },
                          icon: Icon(Icons.delete)),
                    );
                  }),
        );
      }
          ),
    );
  }
}
