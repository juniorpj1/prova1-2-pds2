package model.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import model.domain.DetalhePedido;
import model.domain.Pedido;
import model.domain.Status;

public class PedidoDao {
	
	
	@PersistenceContext(unitName="SistemaEcommercePU")
	private EntityManager entityManager;

	public Double getValorTotalPedido(Integer numeroPedido) {
		StringBuffer hql = new StringBuffer("from DetalhePedido d where d.pedido.numero = :numero");
		Query query = entityManager.createQuery(hql.toString());
		query.setParameter("numero",numeroPedido);
		List<DetalhePedido> detalhes = query.getResultList();
		double somatorio = 0;
		for (DetalhePedido detalhe: detalhes) {
			somatorio += (detalhe.getPreco() * detalhe.getQuantidade()) - detalhe.getDesconto();
		}
		return somatorio;
	}

	public Double getValorTotalCompraCliente(Integer codigoCliente) {
		StringBuffer hql = new StringBuffer("from DetalhePedido d where d.pedido.cliente.codigo = :numero");
		Query query = entityManager.createQuery(hql.toString());
		query.setParameter("numero",codigoCliente);
		List<DetalhePedido> detalhes = query.getResultList();
		double somatorio = 0;
		for (DetalhePedido detalhe: detalhes) {
			somatorio += (detalhe.getPreco() * detalhe.getQuantidade()) - detalhe.getDesconto();
		}
		return somatorio;
	}

	public Double getValorTotalCompraProduto(Integer codigoProduto) {
		StringBuffer hql = new StringBuffer("from DetalhePedido d where d.produto.codigo = :numero");
		Query query = entityManager.createQuery(hql.toString());
		query.setParameter("numero",codigoProduto);
		List<DetalhePedido> detalhes = query.getResultList();
		double somatorio = 0;
		for (DetalhePedido detalhe: detalhes) {
			somatorio += (detalhe.getPreco() * detalhe.getQuantidade()) - detalhe.getDesconto();
		}
		return somatorio;
	}

	public void getValorTotalPedidoNovos() {
		StringBuffer hql = new StringBuffer("from DetalhePedido d where d.pedido.status = 'NOVO'");
		Query query = entityManager.createQuery(hql.toString());
		//query.setParameter("status",status);
		List<DetalhePedido> detalhes = query.getResultList();
		for (DetalhePedido detalhe: detalhes) {
			detalhe.getPedido().setStatus(Status.FATURADO);
		}
		
	}

	public List<Pedido> getStatusPedido(Integer numeroPedido) {
		StringBuffer hql = new StringBuffer("from Pedido d where d.numero = :numeros");
		
		Query query = entityManager.createQuery(hql.toString());
		query.setParameter("numeros",numeroPedido);
		
		return query.getResultList();
		
	}
	
	
	public List<Pedido> getStatus(Status statusPedido) {
		StringBuffer hql = new StringBuffer("from Pedido d where d.status = :numero");
		
		Query query = entityManager.createQuery(hql.toString());
		query.setParameter("numero",statusPedido);
		
		return query.getResultList();
		
	}
	
	public void mudaStatus(Integer numeroPedido){
		StringBuffer hql = new StringBuffer("from Pedido d where d.numero = :numeros");
		
		Query query = entityManager.createQuery(hql.toString());
		query.setParameter("numeros",numeroPedido);
		
		List<Pedido> pedidos = query.getResultList();
		
		for (Pedido pedido: pedidos) {
			
			pedido.setStatus(Status.CANCELADO);
			
			pedido = entityManager.merge(pedido);
			entityManager.persist(pedido);
			
		}
	}
	
	
	

	
	
	

}
