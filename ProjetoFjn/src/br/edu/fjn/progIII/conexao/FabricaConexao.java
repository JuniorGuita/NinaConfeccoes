package br.edu.fjn.progIII.conexao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/*
 * 
 * @author Antonio Siqueira
 */

public class FabricaConexao {
	
	private static EntityManagerFactory factory = Persistence.createEntityManagerFactory("projeto");
	
	private FabricaConexao(){
		
	}
	
	public static EntityManager getGerenciador(){
		return factory.createEntityManager();
	}
	
	public static void close(){
		factory.close();
	}
	
}