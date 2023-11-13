import 'package:flutter/material.dart';
import 'package:mobile/pages/produtos/domain/usecases/add_product_usecase.dart';
import 'package:mobile/pages/produtos/domain/usecases/produto_usecase.dart';
import 'package:mobx/mobx.dart';

part 'produtos_controller.g.dart';

class ProdutosController = _ProdutosController with _$ProdutosController;

abstract class _ProdutosController with Store {
  final ProdutoUsecase usecase;
  final AddProductUsecase addUsecase;
  _ProdutosController(this.usecase, this.addUsecase);

  @observable
  int? status;
  @observable
  List<dynamic>? produtoEntity;
  @action
  getProdutos() async {
    final result = await usecase();

    result.fold(
      (l) => status = 500,
      (r) {
        produtoEntity = r.toList();
      },
    );
  }

  @observable
  var loading = ValueNotifier(false);
  @action
  showLoading(bool valor) {
    loading.value = valor;
  }

  @observable
  int? addStatus;
  @action
  addProduct(int id) async {
    final result = await addUsecase(id);

    result.fold(
      (l) => addStatus == 500,
      (r) => addStatus = r,
    );
  }
}
