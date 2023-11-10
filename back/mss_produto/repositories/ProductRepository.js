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
      new Product({
        id: 2,
        name: "Droid BB-8 padrão",
        description: "StarVision LTDA",
        price: "R$299,99",
        photo: "../../assets/bb8.png",
      }),
      new Product({
        id: 3,
        name: "Droid D-0 padrão",
        description: "StarVision LTDA",
        price: "R$189,99",
        photo: "../../assets/d0.png",
      }),
      new Product({
        id: 4,
        name: "Rodas extras R2D2 padrão",
        description: "StarVision LTDA",
        price: "R$59,99 cada",
        photo: "../../assets/pneu.png",
      }),
      new Product({
        id: 5,
        name: "Suporte para carregar",
        description: "StarVision LTDA",
        price: "R$100,00",
        photo: "../../assets/suporte.png",
      }),
      new Product({
        id: 6,
        name: "Controle de movimento",
        description: "StarVision LTDA",
        price: "R$169,99",
        photo: "../../assets/controle.png",
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
