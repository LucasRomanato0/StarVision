import React from "react";
import { Link } from "react-router-dom";
import "./navbar.css";
import logo from "../assets/logo.png";
import shop_cart from "../assets/shop_cart.png";

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
        <Link className="promocoes" to="/">
          Promoções
        </Link>
        <Link className="aplicativo" to="/">
          Aplicativo
        </Link>
        <Link className="suporte" to="/">
          Suporte
        </Link>
      </div>

      <div className="perfil">
        <Link to={"/login"} className="login">
          Login
        </Link>
        <img src={shop_cart} alt="Carrinho" className="carrinho" />
      </div>
    </header>
  );
}
