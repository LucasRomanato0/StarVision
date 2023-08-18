const IProductRepository = require("../interfaces/ProductRepositoryInterface");
const Product = require("../entities/Product");

class ProductRepository extends IProductRepository {
  constructor() {
    super();
    this.products = [
      new Product({
        id: 1,
        name: "Droid R2D2 padrão",
        description: "StarVision LTDA",
        price: "R$399,99",
        photo: "../../assets/r2d2_cor.png",
      }),
    ]; //mock
  }

  //Create
  store({ id, name, description, price, photo }) {
    const product = new Product({
      id,
      name,
      description,
      price,
      photo,
    });

    this.products.push(product);
  }

  //Read
  getById(id) {
    let found = this.products.find((product) => product.id === id);

    return found ? [found] : [];
  }

  getAll() {
    return this.products;
  }

  //Update
  update({ id, name, description, price, photo }) {
    const index = this.products.findIndex((p) => p.id === id);

    if (name !== undefined) {
      this.products[index].name = name;
    }
    if (description !== undefined) {
      this.products[index].description = description;
    }
    if (price !== undefined) {
      this.products[index].price = price;
    }
    if (photo !== undefined) {
      this.products[index].photo = photo;
    }
  }

  //Delete
  delete(id) {
    this.products = this.products.filter((product) => product.id !== id);
  }
}

module.exports = ProductRepository;
