// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartController on _CartController, Store {
  late final _$statusAtom =
      Atom(name: '_CartController.status', context: context);

  @override
  int? get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(int? value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$cartEntityAtom =
      Atom(name: '_CartController.cartEntity', context: context);

  @override
  List<dynamic>? get cartEntity {
    _$cartEntityAtom.reportRead();
    return super.cartEntity;
  }

  @override
  set cartEntity(List<dynamic>? value) {
    _$cartEntityAtom.reportWrite(value, super.cartEntity, () {
      super.cartEntity = value;
    });
  }

  late final _$getCartAsyncAction =
      AsyncAction('_CartController.getCart', context: context);

  @override
  Future getCart() {
    return _$getCartAsyncAction.run(() => super.getCart());
  }

  @override
  String toString() {
    return '''
status: ${status},
cartEntity: ${cartEntity}
    ''';
  }
}
