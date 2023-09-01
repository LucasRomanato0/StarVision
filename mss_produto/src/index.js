const express = require("express");

const app = express();
app.use(express.json());

const cors = require("cors");
app.use(cors());

const axios = require("axios");

const port = process.env.PORT || 3030;

const ProductRepository = require("./repositories/ProductRepository");
const productRepo = new ProductRepository();

const CartRepository = require("./repositories/CartRepository");
const cartRepo = new CartRepository(productRepo);

// ------------------------- PRODUTOS ----------------------------
app.post("/products", async (req, res) => {
  try {
    const { id, name, description, price, photo } = req.body;

    const found = await productRepo.getById(id);

    const newProduct = {
      id: id,
      name: name,
      description: description,
      price: price,
      photo: photo,
    };

    if (!id) {
      res.status(400).json({ message: "Product id is missing" });
    } else {
      if (found.length === 0) {
        await productRepo.store(newProduct);

        res.status(201).json(newProduct);
      } else {
        res.status(403).json({ message: "Product already exists" });
      }
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

app.get("/products", async (req, res) => {
  try {
    let products = await productRepo.getAll();

    if (products.length === 0) {
      res.status(404).json({ message: "No products found. Register one." });
    } else {
      res.status(200).json(products);
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

app.get("/products/:id", async (req, res) => {
  try {
    const id = req.params.id;
    const found = await productRepo.getById(id);

    if (found.length !== 0) {
      res.status(200).json(found);
    } else {
      res.status(404).json({ message: "Product not found" });
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

app.put("/products/:id", async (req, res) => {
  try {
    const id = req.params.id;
    const { name, description, price, photo } = req.body;

    if (!id) {
      res.status(400).json({ message: "Product id is missing" });
    } else {
      const found = await productRepo.getById(id);

      if (found.length !== 0) {
        await productRepo.update({ id, name, description, price, photo });

        res.status(200).json(productRepo.getById(id));
      } else {
        res.status(404).json({
          message: `Error to update product. Product not found for id: ${id}`,
        });
      }
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

app.delete("/products", async (req, res) => {
  try {
    const { id } = req.body;
    const found = productRepo.getById(id);

    if (!id) {
      res.status(400).json({ message: "Product id is missing" });
    } else {
      if (found.length !== 0) {
        productRepo.delete(id);
        res.status(200).type("application/json").send(productRepo.getAll());
      } else {
        res.status(404).json({ message: "Product not found" });
      }
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

// ------------------------- CARRINHO ----------------------------
app.post("/cart", async (req, res) => {
  try {
    const { id } = req.body;
    const foundProduct = productRepo.getById(id).length !== 0;

    if (!id) {
      res.status(400).json({ message: "Product id is missing" });
    } else {
      if (foundProduct) {
        cartRepo.add(id);
        res.status(201).json(cartRepo.getById(id));
      } else {
        res.status(404).json({ message: "Product not found" });
      }
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

app.get("/cart", async (req, res) => {
  try {
    let cart = await cartRepo.getAllCart();
    if (cart.length > 0) {
      res.status(200).json(cart);
    } else {
      res.status(404).json({ message: "Empty" });
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

app.delete("/cart", async (req, res) => {
  try {
    const { id } = req.body;
    const foundProduct = productRepo.getById(id).length !== 0;

    if (!id) {
      res.status(400).json({ message: "Product id is missing" });
    } else {
      if (foundProduct) {
        const productInCart = cartRepo.getById(id);

        if (productInCart.length !== 0) {
          cartRepo.remove(id);
          let cart = await cartRepo.getAllCart();
          res.status(200).json(cart);
        } else {
          res.status(404).json({ message: `Product ${id} not in cart` });
        }
      } else {
        res.status(404).json({ message: "Product not found" });
      }
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

app.post("/events", (req, res) => {
  const event = req.body;

  res.status(200).json({ message: "ok" });
});

app.listen(port, () => console.log(`Listening to port ${port}`));
