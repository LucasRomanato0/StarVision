const express = require("express");

const app = express();
app.use(express.json());

const users = [];

function checkLoginAndPassword(req, res, next) {
  if (!req.body.login || !req.body.password) {
    return res.status(400).json({ error: "campo obrigatorio faltando." });
  }

  return next();
}

function checkIndex(req, res, next) {
  const user = users[req.param.index];
  if (!user) {
    return res.status(400).json({ error: "Este user não existe" });
  }

  req.user = user;

  return next();
}

app.post("/cadastro", checkLoginAndPassword, (req, res) => {
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
    return res.json({ message: "usuario criado" });
  } else {
    return res.json({
      message: `usuário com login '${login}' já existente`,
    });
  }
});

app.post("/login", checkLoginAndPassword, (req, res) => {
  const { login, password } = req.body;
  const found = users.find(
    (user) => user.login == login && user.password == password
  );

  if (!found) {
    return res.json({ message: "usuario nao encontrado" });
  } else {
    return res.json({ message: "login realizado com sucesso" });
  }
});

app.get("/get-user/:index", checkIndex, (req, res) => {
  const { index } = req.params;

  console.log("index: " + index);

  return res.json(users[index]);
});

app.get("/get-user", (req, res) => {
  return res.json(users);
});

app.put("/update-user/:index", checkIndex, (req, res) => {
  const { index } = req.params;
  const { login, email, password } = req.body;

  if (login !== undefined) {
    users[index].login = login;
    console.log("login atualizado");
  }
  if (email !== undefined) {
    users[index].email = email;
    console.log("email atualizado");
  }
  if (password !== undefined) {
    users[index].password = password;
    console.log("senha atualizada");
  }

  return res.json({ message: "usuario atualizado" });
});

app.delete("/delete-user/:index", checkIndex, (req, res) => {
  const { index } = req.params;

  console.log("User deletado: " + users[index].login);

  users.splice(index, 1);
  return res.json({
    message: `User deletado com sucesso!`,
  });
});

app.listen(3005);
