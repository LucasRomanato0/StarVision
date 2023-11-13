// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produtos_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProdutosController on _ProdutosController, Store {
  late final _$statusAtom =
      Atom(name: '_ProdutosController.status', context: context);

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

  late final _$produtoEntityAtom =
      Atom(name: '_ProdutosController.produtoEntity', context: context);

  @override
  List<dynamic>? get produtoEntity {
    _$produtoEntityAtom.reportRead();
    return super.produtoEntity;
  }

  @override
  set produtoEntity(List<dynamic>? value) {
    _$produtoEntityAtom.reportWrite(value, super.produtoEntity, () {
      super.produtoEntity = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_ProdutosController.loading', context: context);

  @override
  ValueNotifier<bool> get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(ValueNotifier<bool> value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$addStatusAtom =
      Atom(name: '_ProdutosController.addStatus', context: context);

  @override
  int? get addStatus {
    _$addStatusAtom.reportRead();
    return super.addStatus;
  }

  @override
  set addStatus(int? value) {
    _$addStatusAtom.reportWrite(value, super.addStatus, () {
      super.addStatus = value;
    });
  }

  late final _$getProdutosAsyncAction =
      AsyncAction('_ProdutosController.getProdutos', context: context);

  @override
  Future getProdutos() {
    return _$getProdutosAsyncAction.run(() => super.getProdutos());
  }

  late final _$addProductAsyncAction =
      AsyncAction('_ProdutosController.addProduct', context: context);

  @override
  Future addProduct(int id) {
    return _$addProductAsyncAction.run(() => super.addProduct(id));
  }

  late final _$_ProdutosControllerActionController =
      ActionController(name: '_ProdutosController', context: context);

  @override
  dynamic showLoading(bool valor) {
    final _$actionInfo = _$_ProdutosControllerActionController.startAction(
        name: '_ProdutosController.showLoading');
    try {
      return super.showLoading(valor);
    } finally {
      _$_ProdutosControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
produtoEntity: ${produtoEntity},
loading: ${loading},
addStatus: ${addStatus}
    ''';
  }
}
