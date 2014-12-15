package br.edu.fjn.progIII.dao;

import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;

import br.edu.fjn.progIII.conexao.FabricaConexao;
import br.edu.fjn.progIII.model.Produto.Produto;
import br.edu.fjn.progIII.model.Venda.Venda;

public class VendaDAO {

	public void salvarVenda(Venda venda) {
		System.out.println("Venda DAO salvo");
		EntityManager manager = FabricaConexao.getGerenciador();
		manager.getTransaction().begin();

		try {
			manager.persist(venda);
			manager.getTransaction().commit();
		} catch (NullPointerException e) {
			manager.getTransaction().rollback();
		} catch (Exception e) {
			manager.getTransaction().rollback();
		} finally {
			manager.close();
		}
	}
	
	public List<Venda> listarVendas() {
		EntityManager manager = FabricaConexao.getGerenciador();
		Session session = (Session) manager.getDelegate();

		Criteria criteria = session.createCriteria(Venda.class);


		return criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
				.list();
	}
	
	public Venda buscaPorId(int id) {
		EntityManager manager = FabricaConexao.getGerenciador();
		Session session = (Session) manager.getDelegate();

		Criterion c1 = Restrictions.eq("id", id);
		Criteria criteria = session.createCriteria(Venda.class);
		criteria.add(c1);

		return (Venda) criteria.uniqueResult();

	}

	public void deletarVenda(int id) {
		EntityManager manager = FabricaConexao.getGerenciador();
		manager.getTransaction().begin();

		try {
			Venda venda = manager.find(Venda.class, id);
			manager.remove(venda);
			manager.getTransaction().commit();
		} catch (NullPointerException e) {
			manager.getTransaction().rollback();
		} catch (Exception e) {
			manager.getTransaction().rollback();
		} finally {
			manager.close();
		}
	}
	
	public List<Venda> busca(String string) {
		EntityManager manager = FabricaConexao.getGerenciador();
		Session session = (Session) manager.getDelegate();
		Criteria criteria = session.createCriteria(Venda.class);
		Criterion c1 = Restrictions.ilike("calendar", "%" + string + "%");
		
		criteria.add(c1);

		List<Venda> vendas = criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
				.list();
		return vendas;
	}
	
}
