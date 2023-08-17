import React from "react";
import { Link } from "react-router-dom";
import "./navbar.css";
import logo from "../assets/logo.png";
import shop_cart from "../assets/shop_cart.png";
import lupa from "../assets/lupa.png";

export default function NavBar() {
  return (
    <header>
      <div className="div-logo">
        <img src={logo} alt="StarVision" className="logo" />
        <h1 className="text-logo">StarVision</h1>
      </div>

      <div className="infos">
        <Link className="aboutus" to="/aboutus">
          Sobre nós
        </Link>
        <Link className="produtos" to="/categoria">
          Produtos
        </Link>
        <Link className="aplicativo" to="/app">
          Aplicativo
        </Link>
        <Link className="suporte" to="/suport">
          Suporte
        </Link>
      </div>

      <div className="wrap-search">
        <input className="search" />
        <span className="busca-input" data-placeholder="Buscar"></span>
        <img src={lupa} alt="Bucar" className="lupa" />
      </div>

      <div className="perfil">
        <Link to={"/login"} className="login">
          Login
        </Link>

        <Link to={"/carempty"}>
          <img src={shop_cart} alt="Carrinho" className="carrinho" />
        </Link>
      </div>
    </header>
  );
}
