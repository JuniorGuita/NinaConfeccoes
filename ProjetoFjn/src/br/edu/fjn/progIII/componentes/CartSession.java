package br.edu.fjn.progIII.componentes;

import java.io.Serializable;

import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

import br.edu.fjn.progIII.model.Carrinho.Carrinho;
import br.edu.fjn.progIII.model.Item.Item;
import br.edu.fjn.progIII.model.Produto.Produto;

/**
 * 
 * @author Fransuelio Nobre
 *
 *
 *         Carrinho de compras
 */
@SessionScoped
@Named("sessionCart")
public class CartSession implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5326502009673780873L;
	private Carrinho carrinho = new Carrinho();

	
	public CartSession() {
	}
	
	public Carrinho getCarrinho() {
		return carrinho;
	}

	public void setCarrinho(Carrinho carrinho) {
		this.carrinho = carrinho;
	}
	
	public void addCarrinho(Item item){
		System.out.println("[CartSession] adicionar novo item ao carrinho");
		this.carrinho.addItem(item);
	}
	
	public void removeItem(int chave){
		this.carrinho.remove(chave);
	}
	
	

}
