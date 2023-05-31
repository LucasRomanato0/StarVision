const ICartRepository = require("../interfaces/CartRepositoryInterface");
const Cart = require("../entities/Cart");

class CartRepository extends ICartRepository {
  constructor(productRepository) {
    super();
    this.productRepo = productRepository;
    this.cart = [];
  }

  getById(id) {
    let found = this.cart.find((cart) => cart.product[0].id === id);

    return found ? [found] : [];
  }

  add({ id, qtd }) {
    //verifica se o produto ja esta no carrinho
    const index = this.cart.findIndex((cart) => cart.product[0].id === id);

    if (index === -1) {
      let product = this.productRepo.getById(id);
      const order = new Cart(product, qtd ? qtd : 1);
      this.cart.push(order);
    } else {
      this.cart[index].quantity++;
    }
  }
}

module.exports = CartRepository;
