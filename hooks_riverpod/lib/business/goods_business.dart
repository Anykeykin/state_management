
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/goods.dart';

final addGoodsProvider = StateNotifierProvider<Goods, List>((_) => Goods());

class Goods extends StateNotifier<List> {
  Goods() : super([]);
  // void increment() => state++;
  void increment(item) => state.add(item);
  // void delete(item) => state = state + state.remove(item);
  void delete(item) => state.remove(item);
}

class AllGoods {
  loadedGoods(){
    final goods = GoodsList().loadGoods();
    return goods;
  }
}