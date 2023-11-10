import 'package:mobile/pages/cart/domain/usecases/get_cart_usecase.dart';
import 'package:mobx/mobx.dart';

part 'cart_controller.g.dart';

class CartController = _CartController with _$CartController;

abstract class _CartController with Store {
  GetCartUsecase usecase;
  _CartController(this.usecase);

  @observable
  int? status;
  @observable
  List<dynamic>? cartEntity;
  @action
  getCart() async {
    final result = await usecase();

    result.fold(
      (l) => status = 500,
      (r) {
        if (r == 404) {
          status = r;
        } else {
          cartEntity = r.toList();
          status = 1;
        }
      },
    );
  }
}
