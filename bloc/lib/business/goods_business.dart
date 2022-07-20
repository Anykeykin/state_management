
import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import '../data/goods.dart';


class GoodsBloc {
  List listGoods = [];
  final goods = GoodsList().loadGoods();

  final _goodsController = StreamController.broadcast();
  Stream get getStream => _goodsController.stream;

  void addGoods(item) {
    listGoods.add(item);
    _goodsController.sink.add(listGoods);
  }

  void removeGoods(item) {
    listGoods.remove(item);
    _goodsController.sink.add(listGoods);
  }

  void dispose() {
    _goodsController.close();
  }
}
 final bloc = GoodsBloc();

class AllGoods {
  loadedGoods(){
    final goods = GoodsList().loadGoods();
    return goods;
  }
}