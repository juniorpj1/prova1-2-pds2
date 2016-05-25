package model.facade.ws;

import java.util.List;

import javax.inject.Inject;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;

import model.dao.PedidoDao;
import model.domain.Pedido;
import model.domain.Status;
import model.facade.PedidoFacade;

@WebService(serviceName="ws/pedido")
public class PedidoFacadeImpl implements PedidoFacade {
	
	@Inject
	private PedidoDao pedidoDao;
				
	@Override
	@WebMethod
	public Double getValorTotalPedido(@WebParam(name="numeroPedido") Integer numeroPedido) {
		return pedidoDao.getValorTotalPedido(numeroPedido);
	}

	@Override
	@WebMethod
	public Double getValorTotalCompraCliente(@WebParam(name="codigoCliente") Integer codigoCliente) {
		return pedidoDao.getValorTotalCompraCliente(codigoCliente);
	}

	@Override
	@WebMethod
	public Double getValorTotalCompraProduto(@WebParam(name="codigoProduto") Integer codigoProduto) {
		return pedidoDao.getValorTotalCompraProduto(codigoProduto);
	}

	@Override
	@WebMethod
	public void getValorTotalPedidoNovos() {
		pedidoDao.getValorTotalPedidoNovos();
	}

	@Override
	public List<Pedido> getStatusPedido(Integer numeroPedido) {
		return pedidoDao.getStatusPedido(numeroPedido);
	}

	@Override
	public List<Pedido> getStatus(Status statusPedido) {
		return pedidoDao.getStatus(statusPedido);
	}

	@Override
	public void mudaStatus(Integer numeroPedido) {
		pedidoDao.mudaStatus(numeroPedido);
		
	}

}
