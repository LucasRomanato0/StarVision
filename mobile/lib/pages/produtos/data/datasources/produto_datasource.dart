import 'package:mobile/pages/produtos/data/models/produto_model.dart';

abstract class ProdutoDatasource {
  Future<List<ProdutoModel>> getProdutos();
}
