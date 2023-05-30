const Product = require("../models/Product");

class ProductController {
  store(req, res) {
    const { code, name, description, price } = req.body;

    const product = new Product({
      code,
      name,
      description,
      price,
    });

    res.json(product);
  }
}

module.exports(ProductController);
