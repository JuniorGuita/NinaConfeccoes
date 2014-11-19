/**
 * @author Fransuelio Nobre
 */
package br.edu.fjn.progIII.dao;

import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.Session;

import br.edu.fjn.progIII.conexao.FabricaConexao;
import br.edu.fjn.progIII.model.Cidade;


public class CidadeDAO {
	private List<Cidade> cidades;
	
	
	public List<Cidade> getList() {
		EntityManager manager = FabricaConexao.getGerenciador();
		Session session = (Session) manager.getDelegate();
		Criteria criteria = session.createCriteria(Cidade.class);

		// return criteria.setResultTransformer(
		// CriteriaSpecification.DISTINCT_ROOT_ENTITY).list();
		// return criteria.list();
		cidades = criteria.list();
		return cidades;
	}
}
