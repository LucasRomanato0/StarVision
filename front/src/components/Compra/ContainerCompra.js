import "./containercompras.css";

export default function ContainerCompra({
  src,
  titulo,
  preco,
  p,
  amarelo,
  qtd,
}) {
  return (
    <div>
      <hr className="hr-top" />
      <div className="compra">
        <img src={src} alt="R2D2" className="img-r2d2" />

        <div className="colum-compras">
          <p className="titulo-compras">{titulo}</p>
          <p className="preco-compras">{preco}</p>
          <p>{p}</p>
          <p className="amarelo">{amarelo}</p>

          <div className="row-compras">
            <button className="btn-qtd">Qtd: {qtd}</button>
            <hr />
            <button className="btn-compras-generico">Excluir</button>
            <hr />
            <button className="btn-compras-generico">
              Salvar para mais tarde
            </button>
            <hr />
            <button className="btn-compras-generico">Compartilhar</button>
          </div>
        </div>
      </div>
    </div>
  );
}
