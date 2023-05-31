const express = require("express");

const app = express();
app.use(express.json());

const port = process.env.PORT || 3030;

const ProductRepository = require("./repositories/ProductRepository");
const Product = require("./entities/Product");
const repo = new ProductRepository();

app.post("/products", async (req, res) => {
  try {
    const { id, name, description, price, photo } = req.body;

    const found = await repo.getById(id);

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
        await repo.store(newProduct);

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
    let products = await repo.getAll();

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
    const found = await repo.getById(id);

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
      const found = await repo.getById(id);

      if (found.length !== 0) {
        await repo.update({ id, name, description, price, photo });

        res.status(200).json(repo.getById(id));
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
    const found = repo.getById(id);

    if (!id) {
      res.status(400).json({ message: "Product id is missing" });
    } else {
      if (found.length !== 0) {
        repo.delete(id);
        res.status(200).type("application/json").send(repo.getAll());
      } else {
        res.status(404).json({ message: "Product not found" });
      }
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

app.listen(port, () => console.log(`Listening to port ${port}`));
