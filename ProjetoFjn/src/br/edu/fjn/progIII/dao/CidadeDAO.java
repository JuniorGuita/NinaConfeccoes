/**
 * @author Fransuelio Nobre
 */
package br.edu.fjn.progIII.dao;

import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import br.edu.fjn.progIII.conexao.FabricaConexao;
import br.edu.fjn.progIII.model.Cidade.Cidade;


public class CidadeDAO {
	private List<Cidade> cidades;
	
	
	public List<Cidade> getList(String estadoId) {
		EntityManager manager = FabricaConexao.getGerenciador();
		Session session = (Session) manager.getDelegate();
		
		Integer idEstado = Integer.parseInt(estadoId);
		
		
		Criterion c1 = Restrictions.eq("estado.id", idEstado);
		Criteria criteria = session.createCriteria(Cidade.class);
		criteria.add(c1);
		
		cidades = criteria.list();
		return cidades;
	}
}
