import 'package:mobile/pages/produtos/domain/entities/produto_entity.dart';
import 'package:mobile/pages/produtos/domain/usecases/produto_usecase.dart';
import 'package:mobx/mobx.dart';

part 'produtos_controller.g.dart';

class ProdutosController = _ProdutosController with _$ProdutosController;

abstract class _ProdutosController with Store {
  final ProdutoUsecase usecase;
  _ProdutosController(this.usecase);

  @observable
  int? status;
  @observable
  List<ProdutoEntity> produtoEntity = [];
  @action
  getProdutos() async {
    final result = await usecase();

    result.fold(
      (l) => status = 500,
      (r) => produtoEntity = r,
    );
  }
}
