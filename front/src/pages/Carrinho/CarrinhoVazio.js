import NavBar from "../../components/NavBar";

import carrinho_vazio from "../../assets/carrinho_vazio.png";
import { Link } from "react-router-dom";

import "./carrinho.css";

function CarrinhoVazio() {
  return (
    <div>
      <NavBar />
      <div className="corpo">
        <div className="container-principal">
          <img
            src={carrinho_vazio}
            alt="Carrinho vazio"
            className="carrinho-vazio"
          />

          <div className="container-dentro">
            <h1>{"Seu carrinho está vazio :("}</h1>

            <div className="container-btn">
              <Link to={"/categoria"} className="btn-voltar">
                Voltar para a loja
              </Link>
              <Link to={"/login"} className="btn-voltar-login">
                Fazer login ou increver-se
              </Link>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default CarrinhoVazio;
