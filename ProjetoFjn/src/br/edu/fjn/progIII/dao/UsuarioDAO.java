package br.edu.fjn.progIII.dao;

import java.util.List;
import javax.persistence.EntityManager;
import org.hibernate.Criteria;
import org.hibernate.Session;
import br.edu.fjn.progIII.conexao.FabricaConexao;
import br.edu.fjn.progIII.model.Usuario;

/*
 * 
 * @author Antonio Siqueira
 */

public class UsuarioDAO {

	public void salvaUsuario(Usuario usuario) {
		EntityManager manager = FabricaConexao.getGerenciador();
		manager.getTransaction().begin();

		try {
			manager.persist(usuario);
			manager.getTransaction().commit();
		} catch (NullPointerException e) {
			manager.getTransaction().rollback();
		} catch (Exception e) {
			manager.getTransaction().rollback();
		} finally {
			manager.close();
		}
	}

	public List<Usuario> listarUsuarios(Usuario usuarioList) {
		EntityManager manager = FabricaConexao.getGerenciador();
		Session session = (Session) manager.getDelegate();

		Criteria criteria = session.createCriteria(Usuario.class);
 
		return criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
				.list();
	}

}
