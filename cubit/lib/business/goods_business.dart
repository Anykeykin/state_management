
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/goods.dart';


class GoodsBloc extends Cubit<List> {
  late List listGoods = [];
  GoodsBloc() : super([]);

  // Stream<List> increment(item) async* {
  //   state.add(item);
  //   yield state;
  // }
  //
  // Stream<List> delete(item) async* {
  //   state.remove(item);
  //   yield state;
  // }
  void increment(item) => state.add(item);

  void delete(item) => state.remove(item);
}

class AllGoods {
  loadedGoods(){
    final goods = GoodsList().loadGoods();
    return goods;
  }
}