package br.edu.fjn.progIII.conexao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/*
 * 
 * @author Antonio Siqueira
 */

public class FabricaConexaoLog {
	
	private static EntityManagerFactory factory = Persistence.createEntityManagerFactory("log");
	
	private FabricaConexaoLog(){
		
	}
	
	public static EntityManager getGerenciadorLog(){
		return factory.createEntityManager();
	}
	
	public static void close(){
		factory.close();
	}
	
}