import "./carrinhosugestao.css";

export default function CarrinhoSugestao({
  img,
  descricao1,
  descricao2,
  preco,
}) {
  return (
    <div>
      <div className="row-sugestoes">
        <img src={img} alt="Suporte" />
        <div className="colum-sugestao">
          <p className="desc-sugestao">{descricao1}</p>
          <p className="desc-sugestao">{descricao2}</p>
          <p className="preco-sugestao">{preco}</p>
          <button className="btn-cart">Adicionar ao carrinho</button>
        </div>
      </div>
      <hr />
    </div>
  );
}
