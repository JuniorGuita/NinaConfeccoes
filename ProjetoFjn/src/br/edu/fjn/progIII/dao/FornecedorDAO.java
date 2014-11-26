package br.edu.fjn.progIII.dao;

import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.hibernate.service.spi.Manageable;

import br.edu.fjn.progIII.conexao.FabricaConexao;
import br.edu.fjn.progIII.model.Produto.Produto;
import br.edu.fjn.progIII.model.fornecedor.Fornecedor;

public class FornecedorDAO {

	private List<Fornecedor> fornecedor;

	public void salvarFornecedor(Fornecedor fornecedor) {
		EntityManager manager = FabricaConexao.getGerenciador();
		manager.getTransaction().begin();
		try {
			manager.persist(fornecedor);
			manager.getTransaction().commit();
		} catch (NullPointerException e) {
			manager.getTransaction().rollback();
		} catch (Exception e) {
			manager.getTransaction().rollback();
		} finally {
			manager.close();
		}
	}

	public void deletarFornecedor(int id) {
		EntityManager manager = FabricaConexao.getGerenciador();
		manager.getTransaction().begin();
		
		try {
			Fornecedor fornecedor = manager.find(Fornecedor.class, id);
			manager.remove(fornecedor);
			manager.getTransaction().commit();	
		} catch (NullPointerException e) {
			manager.getTransaction().rollback();
		} catch (Exception e) {
			manager.getTransaction().rollback();
		} finally {
			manager.close();
		}
	}
	
	public void editar(Fornecedor fornecedor) {
		EntityManager manager = FabricaConexao.getGerenciador();
		manager.getTransaction().begin();
		try {
			manager.merge(fornecedor);
			manager.getTransaction().commit();
		} catch (NullPointerException e) {
			manager.getTransaction().rollback();
		} catch (Exception e) {
			manager.getTransaction().rollback();
		} finally {
			manager.close();
		}
	}

	public Fornecedor buscaPorId(Integer idFornecedor) {
		EntityManager manager = FabricaConexao.getGerenciador();
		Session session = (Session) manager.getDelegate();

		Criterion c1 = Restrictions.eq("id", idFornecedor);
		Criteria criteria = session.createCriteria(Fornecedor.class);
		criteria.add(c1);

		return (Fornecedor) criteria.uniqueResult();

	}

	public List<Fornecedor> listarFornecedor() {
		EntityManager manager = FabricaConexao.getGerenciador();
		Session session = (Session) manager.getDelegate();
		Criteria criteria = session.createCriteria(Fornecedor.class);
		criteria.addOrder(Property.forName("nome").asc());
		return criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
				.list();
	}
}
