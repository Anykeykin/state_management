
import 'package:flutter/material.dart';

import '../data/goods.dart';

class Goods with ChangeNotifier {
  List goodsList = [];

  void increment(item){
    goodsList.add(item);
    print(goodsList);
    notifyListeners();
  }
  void delete(item){
    goodsList.remove(item);
    print(goodsList);
    notifyListeners();
  }
}

class AllGoods {
  loadedGoods(){
    final goods = GoodsList().loadGoods();
    return goods;
  }
}