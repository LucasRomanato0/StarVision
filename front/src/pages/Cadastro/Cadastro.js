import { useState } from "react";
import "./cadastro.css";
import { Link, useNavigate } from "react-router-dom";

import axios from "axios";

function Cadastro() {
  const [username, setUsername] = useState("");
  const [email, setEmail] = useState("");
  const [telefone, setTelefone] = useState("");
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const navigate = useNavigate();

  const handleRegister = async (e) => {
    e.preventDefault();

    try {
      const response = await axios.post("http://localhost:3005/cadastro", {
        login: username,
        email: email,
        phone: telefone,
        password: password,
      });

      console.log(response.data);

      if (response.status === 201) {
        console.log("usuario criado com sucesso");
        navigate("/login");
      } else if (response.status === 403) {
        window.alert("Usuário já existente.");
      }
    } catch (error) {
      window.alert("Erro ao cadastrar.");
      console.log("Erro ao logar o usuario: " + error);
    }
  };

  return (
    <div className="container">
      <div className="container-login">
        <div className="wrap-login">
          <form className="form-login" onSubmit={handleRegister}>
            {/* parte de cima */}
            <span className="login-form-title">Faça seu cadastro!</span>
            <hr className="hr-lightsaber" />

            {/* input nome usuário */}
            <div className="wrap-input">
              <input
                className={username !== "" ? "has-val input" : "input"}
                type="text"
                value={username}
                onChange={(e) => setUsername(e.target.value)}
              />
              <span
                className="focus-input"
                data-placeholder="Escolha um nome de usuário"
              ></span>
            </div>

            {/* input email */}
            <div className="wrap-input">
              <input
                className={email !== "" ? "has-val input" : "input"}
                type="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
              />
              <span className="focus-input" data-placeholder="Email"></span>
            </div>

            {/* input telefone */}
            <div className="wrap-input">
              <input
                className={telefone !== "" ? "has-val input" : "input"}
                type="text"
                value={telefone}
                onChange={(e) => setTelefone(e.target.value)}
              />
              <span className="focus-input" data-placeholder="Telefone"></span>
            </div>

            {/* input senha */}
            <div className="wrap-input">
              <input
                className={password !== "" ? "has-val input" : "input"}
                type="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
              />
              <span
                className="focus-input"
                data-placeholder="Digite uma senha"
              ></span>
            </div>

            {/* input confirma senha */}
            <div className="wrap-input">
              <input
                className={confirmPassword !== "" ? "has-val input" : "input"}
                type="password"
                value={confirmPassword}
                onChange={(e) => setConfirmPassword(e.target.value)}
              />
              <span
                className="focus-input"
                data-placeholder="Confirme sua senha"
              ></span>
            </div>

            {/* botao cadastre-se */}
            <div className="container-login-form-btn">
              {/* <Link to={"/aboutus"} className="login-form-btn">
                Cadastre-se
              </Link> */}
              <button type="submit" className="login-form-btn">
                Cadastre-se
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
}

export default Cadastro;
