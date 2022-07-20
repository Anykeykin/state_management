
import 'package:reduxer/business/actions.dart';
import 'package:reduxer/business/app_state.dart';

import '../data/goods.dart';

AppState reducer(AppState state, dynamic action) {
  final goods = GoodsList().loadGoods();
  if(action is AddGoods){
    state.listGoods.add(action.good);
    return AppState(goods: goods, listGoods: state.listGoods);
  } else if(action is RemoveGoods){
    state.listGoods.remove(action.good);
    return AppState(goods: goods, listGoods: state.listGoods);
  } else {
    return state;
  }
}