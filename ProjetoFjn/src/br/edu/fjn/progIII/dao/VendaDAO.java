package br.edu.fjn.progIII.dao;

import javax.persistence.EntityManager;

import br.edu.fjn.progIII.conexao.FabricaConexao;
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
}
