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

  getAllCart() {
    return this.cart;
  }

  add(id) {
    //verifica se o produto ja esta no carrinho
    const index = this.cart.findIndex((cart) => cart.product[0].id === id);

    if (index === -1) {
      // nao tem
      let product = this.productRepo.getById(id);
      const order = new Cart(product, 1);
      this.cart.push(order);
    } else {
      this.cart[index].qtd++;
    }
  }

  remove(id) {
    const index = this.cart.findIndex((cart) => cart.product[0].id === id);

    if (index !== -1) {
      // tem
      if (this.cart[index].qtd > 1) {
        this.cart[index].qtd--;
      } else {
        this.cart.splice(index, 1);
      }
    }
  }
}

module.exports = CartRepository;
