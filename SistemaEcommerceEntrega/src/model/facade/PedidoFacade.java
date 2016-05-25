package model.facade;

import java.util.List;

import model.domain.Pedido;
import model.domain.Status;

public interface PedidoFacade {
	
	public Double getValorTotalPedido(Integer numeroPedido);
	
	public Double getValorTotalCompraCliente(Integer codigoCliente);
	
	public Double getValorTotalCompraProduto(Integer codigoProduto);

	public void getValorTotalPedidoNovos();

	public List<Pedido> getStatusPedido(Integer numeroPedido);
	
	public List<Pedido> getStatus(Status statusPedido);

	public void mudaStatus(Integer numeroPedido);


}
