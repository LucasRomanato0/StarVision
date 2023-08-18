import { useState } from "react";
import logo from "../../assets/logo.png";

import "./login.css";
import { Link, useNavigate } from "react-router-dom";
import axios from "axios";

function Login() {
  const [login, setLogin] = useState("");
  const [password, setPassword] = useState("");
  const navigate = useNavigate();

  const handleLogin = async (e) => {
    e.preventDefault();

    try {
      const response = await axios.post("http://localhost:3005/login", {
        login: login,
        password: password,
      });

      console.log(response.data);

      if (response.status === 200) {
        console.log("usuario logado");
        navigate("/categoria");
      }
    } catch (error) {
      if (error.response.status === 402) {
        window.alert("Login ou senha errados.");
      } else if (error.response.status === 400) {
        window.alert("Campos inválidos ou vazios.");
      } else {
        window.alert("Erro de api.");
      }
      console.log("Erro ao logar o usuario.");
    }
  };

  return (
    <div className="container">
      <div className="container-login">
        <div className="wrap-login">
          <form className="login-form" onSubmit={handleLogin}>
            {/* parte de cima */}
            <span className="login-form-title">Bem Vindo!</span>
            <span className="login-form-title">
              <img src={logo} alt="StarVision" />
            </span>

            {/* input email */}
            <div className="wrap-input">
              <input
                className={login !== "" ? "has-val input" : "input"}
                type="text"
                value={login}
                onChange={(e) => setLogin(e.target.value)}
              />
              <span className="focus-input" data-placeholder="Username"></span>
            </div>

            {/* input senha */}
            <div className="wrap-input">
              <input
                className={password !== "" ? "has-val input" : "input"}
                type="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
              />
              <span className="focus-input" data-placeholder="Senha"></span>
            </div>

            <div className="ancora-senha">
              <a href="#">Esqueci minha senha</a>
            </div>

            {/* botao login */}
            <div className="container-login-form-btn">
              {/* <Link to={"/categoria"} className="login-form-btn">
                Login
              </Link> */}
              <button type="submit" className="login-form-btn">
                Login
              </button>
            </div>

            {/* cadastre-se */}
            <div className="text-center">
              <span className="txt1">Não possui conta?</span>

              <Link to={"/cadastro"}>Cadastre-se!</Link>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
}

export default Login;
