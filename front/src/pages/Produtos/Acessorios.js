import NavBar from "../../components/NavBar";
import { Link } from "react-router-dom";

import pneu from "../../assets/pneu.png";
import suporte from "../../assets/suporte.png";
import controle from "../../assets/controle.png";

import "./produtos.css";

function Acessorios() {
  return (
    <div>
      <NavBar />
      <div className="corpo-produtos">
        <h1 className="h1-droids">Acessórios:</h1>

        <div className="row-produtos">
          <div className="column-produto">
            <Link to={"/"} className="btn-produto">
              <img src={pneu} alt="Pneu" />
            </Link>

            <div className="container-p">
              <p className="nome-produto">Rodas extras R2D2 padrão</p>
              <p className="nome-empresa">StarVision LTDA</p>
              <p className="preco">R$ 59,99 cada</p>
            </div>
          </div>

          <div className="column-produto">
            <Link to={"/"} className="btn-produto">
              <img src={suporte} alt="Suporte" />
            </Link>

            <div className="container-p">
              <p className="nome-produto">Suporte para carregar o Dr...</p>
              <p className="nome-empresa">StarVision LTDA</p>
              <p className="preco">R$ 100,00</p>
            </div>
          </div>

          <div className="column-produto">
            <Link to={"/"} className="btn-produto">
              <img src={controle} alt="Controle" />
            </Link>

            <div className="container-p">
              <p className="nome-produto">Controle de movimento te...</p>
              <p className="nome-empresa">StarVision LTDA</p>
              <p className="preco">R$ 169,99</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Acessorios;
