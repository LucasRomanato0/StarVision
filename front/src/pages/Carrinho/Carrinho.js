import NavBar from "../../components/NavBar/NavBar";
import ContainerCompra from "../../components/Compra/ContainerCompra";
import CarrinhoSugestao from "../../components/CarrinhoSugestao/CarrinhoSugestao";

import r2d2_cor from "../../assets/r2d2_cor.png";
import d0 from "../../assets/d0.png";
import suporte from "../../assets/suporte.png";
import pneu from "../../assets/pneu.png";

function Carrinho() {
  return (
    <div>
      <NavBar />

      {/* Principal */}
      <div className="corpo-carrinho">
        {/* container da esquerda */}
        <div className="container-compras">
          <h1>Carrinho de compras</h1>

          {/* "Generico" */}
          <ContainerCompra
            src={d0}
            titulo={"Droid D-0 desgastado"}
            preco={"R$189,99"}
            p={"em até 3x de R$63,33 sem juros"}
            amarelo={"Estimativa de envio de 4 a 5 dias."}
            qtd={"1"}
          />

          <ContainerCompra
            src={r2d2_cor}
            titulo={"Droid R2D2 padrão"}
            preco={"R$499,99"}
            p={"em até 7x de R$71,43 sem juros"}
            amarelo={"Estimativa de envio de 4 a 5 dias."}
            qtd={"1"}
          />
        </div>

        {/* parte da direita */}
        <div className="colum-direita">
          {/* Subtotal */}
          <div className="subtotal">
            <p className="p-subtotal">{"Subtotal (2 itens):"}</p>
            <p className="preco-subtotal">R$689,98</p>
            <button className="btn-fechar-pedido">Fechar pedido</button>
          </div>

          {/* sugestoes */}
          <div className="sugestoes">
            <p className="p-sugestao">Você também pode gostar:</p>

            <CarrinhoSugestao
              img={suporte}
              descricao1={"Suporte para carregar"}
              descricao2={"o Droid D-0"}
              preco={"R$100,00"}
            />
            <CarrinhoSugestao
              img={pneu}
              descricao1={"Rodas extras R2D2"}
              descricao2={"padrão"}
              preco={"R$59,99 cada"}
            />
          </div>
        </div>
      </div>
    </div>
  );
}

export default Carrinho;
