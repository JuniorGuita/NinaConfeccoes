package br.edu.fjn.progIII.dao;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import br.edu.fjn.progIII.conexao.FabricaConexao;
import br.edu.fjn.progIII.model.Usuario.Usuario;

/*
 * 
 * @author Antonio Siqueira
 */

public class loginDAO {
	
	public boolean validarLogin(String nome, String pass){
		EntityManager manager = FabricaConexao.getGerenciador();
		Session session = (Session) manager.getDelegate();
		Criteria criteria = session.createCriteria(Usuario.class);
		
		Criterion c1 = Restrictions.ilike("nome", nome);
		Criterion c2 = Restrictions.eq("pass", pass);
		
		criteria.add(Restrictions.and(c1,c2));
		
		return criteria.uniqueResult() != null;
	}
	
}
