package br.edu.fjn.progIII.dao;

import javax.persistence.EntityManager;
import br.edu.fjn.progIII.conexao.FabricaConexao;
import br.edu.fjn.progIII.model.Produto;

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
}
