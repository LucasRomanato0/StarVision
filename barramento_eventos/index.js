const express = require("express");
const axios = require("axios");

const app = express();
app.use(express.json());

app.post("/events", (req, res) => {
  const event = req.body;

  //mss_login
  axios.post("http://localhost:3005/events", event);
  //mss_produto
  axios.post("http://localhost:3030/events", event);

  res.status(200).send({ msg: "ok" });
});

app.listen(3100, () => `Listening to port 3100`);
