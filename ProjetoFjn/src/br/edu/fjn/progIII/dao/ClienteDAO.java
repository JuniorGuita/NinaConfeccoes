package br.edu.fjn.progIII.dao;

import javax.persistence.EntityManager;

import br.edu.fjn.progIII.conexao.FabricaConexao;
import br.edu.fjn.progIII.model.Cliente;

public class ClienteDAO {

	public void salvaCliente(Cliente cliente) {
		EntityManager manager = FabricaConexao.getGerenciador();
		manager.getTransaction().begin();

		try {
					
			manager.persist(cliente);
			manager.getTransaction().commit();
		} catch (NullPointerException e) {
			manager.getTransaction().rollback();
		} catch (Exception e) {
			manager.getTransaction().rollback();
		} finally {
			manager.close();
		}

	}

	/*public Cliente buscarPorCpf(String cpf) {
		EntityManager manager = Fabrica.getGerenciador();
		Session session = (Session) manager.getDelegate();

		Criteria criteria = session.createCriteria(Cliente.class);
		criteria.add(Restrictions.eq("cpf", cpf));
		return (Cliente) criteria.uniqueResult();
	}

	public List<Cliente> buscarPorCidade(String nomeDaCidade) {
		EntityManager manager = Fabrica.getGerenciador();
		Session session = (Session) manager.getDelegate();

		Criteria criteria = session.createCriteria(Cliente.class);
		criteria.createAlias("endereco", "end");
		criteria.createAlias("end.cidade", "c");
		criteria.add(Restrictions.eq("c.nome", nomeDaCidade));

		return criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
				.list();
	}*/

}
