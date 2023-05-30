const { Router } = require("express");

const ProductController = require("./controllers/ProductController");

const routes = new Router();

routes.post("/product", ProductController.store);

module.exports(routes);
