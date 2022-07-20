// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Goods on _Goods, Store {
  late final _$listGoodsAtom = Atom(name: '_Goods.listGoods', context: context);

  @override
  List<dynamic> get listGoods {
    _$listGoodsAtom.reportRead();
    return super.listGoods;
  }

  @override
  set listGoods(List<dynamic> value) {
    _$listGoodsAtom.reportWrite(value, super.listGoods, () {
      super.listGoods = value;
    });
  }

  late final _$_GoodsActionController =
      ActionController(name: '_Goods', context: context);

  @override
  void addGoods(dynamic item) {
    final _$actionInfo =
        _$_GoodsActionController.startAction(name: '_Goods.addGoods');
    try {
      return super.addGoods(item);
    } finally {
      _$_GoodsActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeGoods(dynamic item) {
    final _$actionInfo =
        _$_GoodsActionController.startAction(name: '_Goods.removeGoods');
    try {
      return super.removeGoods(item);
    } finally {
      _$_GoodsActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listGoods: ${listGoods}
    ''';
  }
}
