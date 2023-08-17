import { Link } from "react-router-dom";
import NavBar from "../../components/NavBar/NavBar";

import r2d2 from "../../assets/r2d2.png";
import acessorio from "../../assets/acessorio.png";

import "./produtos.css";

function Categoria() {
  return (
    <div>
      <NavBar />
      <div className="corpo">
        <h1 className="h1-produtos">Produtos por categoria</h1>

        <div className="row-categorias">
          <Link to={"/produtos"} className="categoria-btn">
            <img src={r2d2} alt="R2D2" className="produtos-img" />
          </Link>
          <Link to={"/acessorios"} className="categoria-btn">
            <img src={acessorio} alt="Acessorio" className="acessorios-img" />
          </Link>
        </div>

        <div className="row-categorias-p">
          <p className="p-categoria">Droids</p>
          <p className="p-categoria">Acessórios</p>
        </div>
      </div>
    </div>
  );
}

export default Categoria;
