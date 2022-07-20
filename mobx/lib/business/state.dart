import 'package:mobx/mobx.dart';

import '../data/goods.dart';

part 'state.g.dart';

class Goods = _Goods with _$Goods;

abstract class _Goods with Store {
  @observable
  List listGoods = [];

  @action
  void addGoods(item) {
    listGoods.add(item);
    listGoods = listGoods;
  }

  @action
  void removeGoods(item) {
    listGoods.remove(item);
    listGoods = listGoods;
  }
}

class DataGoods {
  loadGoods() {
    return GoodsList().loadGoods();
  }
}