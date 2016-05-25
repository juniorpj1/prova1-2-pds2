package model.facade.rs;

import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import model.dao.PedidoDao;
import model.domain.Pedido;
import model.domain.Status;
import model.facade.PedidoFacade;

@Path("/pedido")
@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
public class PedidoFacadeImpl implements PedidoFacade {
	
	@Inject
	private PedidoDao pedidoDao;

	@GET
	@Override
	@Path("/porPedido/{numeroPedido}")
	public Double getValorTotalPedido(@PathParam("numeroPedido") Integer numeroPedido) {
		return pedidoDao.getValorTotalPedido(numeroPedido);
	}

	@GET
	@Override
	@Path("/porCliente/{codigoCliente}")
	public Double getValorTotalCompraCliente(@PathParam("codigoCliente") Integer codigoCliente) {
		return pedidoDao.getValorTotalCompraCliente(codigoCliente);
	}

	@GET
	@Override
	@Path("/porProduto/{codigoProduto}")
	public Double getValorTotalCompraProduto(@PathParam("codigoProduto") Integer codigoProduto) {
		return pedidoDao.getValorTotalCompraCliente(codigoProduto);
	}
	
	@GET
	@Override
	@Path("/porStatus/")
	public void getValorTotalPedidoNovos() {
		pedidoDao.getValorTotalPedidoNovos();
	}
	
	@GET
	@Override
	@Path("/porNumero/{numeroPedido}")
	public List<Pedido> getStatusPedido(@PathParam("numeroPedido") Integer numeroPedido) {
		return pedidoDao.getStatusPedido(numeroPedido);
	}

	
	@GET
	@Override
	@Path("/status/{statusPedido}")
	public List<Pedido> getStatus(@PathParam("statusPedido") Status statusPedido) {
		return pedidoDao.getStatus(statusPedido);
	}
		
	
	@GET
	@Override
	@Path("/cancelar/{numeroPedido}")
	@Transactional
	public void mudaStatus(@PathParam("numeroPedido") Integer numeroPedido) {
		pedidoDao.mudaStatus(numeroPedido);
	}

	

}
