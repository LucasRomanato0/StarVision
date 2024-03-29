const express = require("express");

const app = express();
app.use(express.json());

const cors = require("cors");
app.use(cors());

const axios = require("axios");

const port = process.env.PORT || 3005;
const barramentoPort = process.env.PORT || 3100;

const users = [];

function checkLoginOrPassword(req, res, next) {
  if (!req.body.login || !req.body.password) {
    return res.status(400).json({ error: "Field is missing." });
  }

  return next();
}

app.post("/cadastro", checkLoginOrPassword, async (req, res) => {
  try {
    const { login, email, phone, password } = req.body;
    const newUser = {
      login: login,
      email: email,
      phone: phone,
      password: password,
    };
    const found = users.find((user) => user.login == login);

    if (!found) {
      users.push(newUser);
      console.log("user criado");

      res.status(201).json({ message: `User '${login}' created` });

      await axios.post(`http://localhost:${barramentoPort}/events`, {
        type: "cadastroUsuario",
        data: {
          user: newUser,
        },
      });
    } else {
      res.status(403).json({
        message: `User '${login} already exists'`,
      });
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

app.post("/login", checkLoginOrPassword, async (req, res) => {
  try {
    const { login, password } = req.body;
    const found = users.find(
      (user) => user.login == login && user.password == password
    );

    if (!found) {
      res.status(402).send("Login or password invalid");
    } else {
      res.status(200).json({ user: found, message: "Login succeeded" });
      await axios.post(`http://localhost:${barramentoPort}/events`, {
        type: "loginUsuario",
        data: {
          user: found,
        },
      });
    }
  } catch (error) {
    console.log(error);
    res.status(500).send("Internal Server Error");
  }
});

app.get("/get-user", (req, res) => {
  res.status(200).json(users);
});

app.put("/update-user", checkLoginOrPassword, (req, res) => {
  const { login, email, phone, password } = req.body;
  const found = users.find((user) => user.login == login);
  const index = users.indexOf(found);

  if (found) {
    // if (login !== undefined) {
    //   users[index].login = login;
    //   console.log("login atualizado");
    // }
    if (email !== undefined) {
      users[index].email = email;
      console.log("email atualizado");
    }
    if (phone !== undefined) {
      users[index].phone = phone;
      console.log("phone atualizado");
    }
    if (password !== undefined) {
      users[index].password = password;
      console.log("senha atualizada");
    } // falta auth

    res.status(201).json({ message: `User '${login}' updated` });
  } else {
    res.status(401).json({ error: `Error to update user '${login}'` });
  }
});

app.delete("/delete-user", (req, res) => {
  try {
    const { login } = req.body;
    const found = users.find((user) => user.login == login);
    const index = users.indexOf(found);

    if (found) {
      console.log("User deletado: " + users[index].login);

      users.splice(index, 1);
      res.status(201).json({ message: `User '${login} deleted'` });
    } else {
      res.status(401).json({ error: `Error to delete user '${login}'` });
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
