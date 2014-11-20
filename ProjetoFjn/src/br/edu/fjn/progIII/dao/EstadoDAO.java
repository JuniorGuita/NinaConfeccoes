package br.edu.fjn.progIII.dao;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.Session;

import br.edu.fjn.progIII.conexao.FabricaConexao;
import br.edu.fjn.progIII.model.Estado.Estado;

/**
 * @author Fransuelio Nobre
 */
import java.util.List;

public class EstadoDAO {

	public List estados = null;

	public List<Estado> getEstados() {
		EntityManager manager = FabricaConexao.getGerenciador();
		Session session = (Session) manager.getDelegate();
		Criteria criteria = session.createCriteria(Estado.class);

		// return criteria.setResultTransformer(
		// CriteriaSpecification.DISTINCT_ROOT_ENTITY).list();
		// return criteria.list();
		estados = criteria.list();
		return estados;

	}

}
