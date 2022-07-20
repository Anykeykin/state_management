
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/goods.dart';

abstract class BasketEvent {}
class addBasketEvent extends BasketEvent {
  final String data;
  addBasketEvent(this.data);
}
class removeBasketEvent extends BasketEvent {
  final String data;
  removeBasketEvent(this.data);
}

class GoodsBloc extends Bloc<BasketEvent,List> {
  late List listGoods = [];
  GoodsBloc() : super([]);

  // @override
  //Не работает
  // Stream<List> mapEventToState(BasketEvent event) async* {
  //   print(state + state);
  //   print('hey');
  //   if(event is removeBasketEvent) {
  //     state.add(event.data);
  //   }
  //   else if(event is addBasketEvent) {
  //     state.remove(event.data);
  //   }
  //   print(state + state);
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