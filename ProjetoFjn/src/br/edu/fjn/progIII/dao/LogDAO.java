package br.edu.fjn.progIII.dao;

import javax.persistence.EntityManager;

import br.edu.fjn.progIII.conexao.FabricaConexao;
import br.edu.fjn.progIII.conexao.FabricaConexaoLog;
import br.edu.fjn.progIII.model.Log.Log;

public class LogDAO {

	
	public void salvarLog(Log log){
		EntityManager manager = FabricaConexaoLog.getGerenciadorLog();
		manager.getTransaction().begin();
		
		try {
			manager.persist(log);
			manager.getTransaction().commit();
		} catch (NullPointerException e) {
			manager.getTransaction().rollback();
		} catch (Exception e) {
			e.printStackTrace();
			manager.getTransaction().rollback();
		} finally {
			manager.close();
		}
		
	}
	
}
