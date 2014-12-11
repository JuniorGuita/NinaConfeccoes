package br.edu.fjn.progIII.dao;

import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Property;

import br.edu.fjn.progIII.conexao.FabricaConexao;
import br.edu.fjn.progIII.model.Produto.Produto;

public class indexDAO {

	public List<Produto> listarProdutos() {
		EntityManager manager = FabricaConexao.getGerenciador();
		Session session = (Session) manager.getDelegate();

		Criteria criteria = session.createCriteria(Produto.class);
		criteria.addOrder(Property.forName("id").desc());
		criteria.setMaxResults(3);
		
		
		return criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
	}
	
}
