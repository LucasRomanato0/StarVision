import NavBar from "../../components/NavBar/NavBar";
import { Link } from "react-router-dom";

import r2d2_cor from "../../assets/r2d2_cor.png";
import bb8 from "../../assets/bb8.png";
import d0 from "../../assets/d0.png";

import "./produtos.css";

function Produtos() {
  return (
    <div>
      <NavBar />
      <div className="corpo-produtos">
        <h1 className="h1-droids">Droids:</h1>

        <div className="row-produtos">
          <div className="column-produto">
            <Link to={"/car"} className="btn-produto">
              <img src={r2d2_cor} alt="R2D2" />
            </Link>

            <div className="container-p">
              <p className="nome-produto">Droid R2D2 padrão</p>
              <p className="nome-empresa">StarVision LTDA</p>
              <p className="preco">R$ 399,99</p>
            </div>
          </div>

          <div className="column-produto">
            <Link to={"/car"} className="btn-produto">
              <img src={bb8} alt="BB-8" />
            </Link>

            <div className="container-p">
              <p className="nome-produto">Droid BB-8 padrão</p>
              <p className="nome-empresa">StarVision LTDA</p>
              <p className="preco">R$ 299,99</p>
            </div>
          </div>

          <div className="column-produto">
            <Link to={"/car"} className="btn-produto">
              <img src={d0} alt="D-0" />
            </Link>

            <div className="container-p">
              <p className="nome-produto">Droid D-0 padrão</p>
              <p className="nome-empresa">StarVision LTDA</p>
              <p className="preco">R$ 189,99</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Produtos;
