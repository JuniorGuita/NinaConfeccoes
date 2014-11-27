package br.edu.fjn.progIII.dao;

import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;

import br.edu.fjn.progIII.conexao.FabricaConexao;
import br.edu.fjn.progIII.model.Fornecedor.Fornecedor;
import br.edu.fjn.progIII.model.Produto.Produto;
import br.edu.fjn.progIII.model.Usuario.Usuario;

/*
 * 
 * @author Antonio Siqueira
 */

public class ProdutoDAO {

	public void salvaProduto(Produto produto) {
		EntityManager manager = FabricaConexao.getGerenciador();
		manager.getTransaction().begin();

		try {
			manager.persist(produto);
			manager.getTransaction().commit();
		} catch (NullPointerException e) {
			manager.getTransaction().rollback();
		} catch (Exception e) {
			manager.getTransaction().rollback();
		} finally {
			manager.close();
		}
	}

	public List<Produto> listarProdutos() {
		EntityManager manager = FabricaConexao.getGerenciador();
		Session session = (Session) manager.getDelegate();

		Criteria criteria = session.createCriteria(Produto.class);
		
		criteria.addOrder(Property.forName("codigo").asc());

		return criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
				.list();
	}
	
	public void deletarProduto(int id) {
		EntityManager manager = FabricaConexao.getGerenciador();
		manager.getTransaction().begin();
		
		try {
			Produto produto = manager.find(Produto.class, id);
			manager.remove(produto);
			manager.getTransaction().commit();	
		} catch (NullPointerException e) {
			manager.getTransaction().rollback();
		} catch (Exception e) {
			manager.getTransaction().rollback();
		} finally {
			manager.close();
		}
	}
	
	public Produto buscaPorId(int id) {
		EntityManager manager = FabricaConexao.getGerenciador();
		Session session = (Session) manager.getDelegate();

		Criterion c1 = Restrictions.eq("id", id);
		Criteria criteria = session.createCriteria(Produto.class);
		criteria.add(c1);

		return (Produto) criteria.uniqueResult();

	}
	
	public void editar(Produto produto) {
		EntityManager manager = FabricaConexao.getGerenciador();
		manager.getTransaction().begin();
		try {
			manager.merge(produto);
			manager.getTransaction().commit();
		} catch (NullPointerException e) {
			manager.getTransaction().rollback();
		} catch (Exception e) {
			manager.getTransaction().rollback();
		} finally {
			manager.close();
		}
	}
	
}
