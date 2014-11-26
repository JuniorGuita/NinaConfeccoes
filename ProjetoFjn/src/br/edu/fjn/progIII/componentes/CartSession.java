package br.edu.fjn.progIII.componentes;

import java.io.Serializable;

import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

import br.edu.fjn.progIII.model.Carrinho.Carrinho;

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
	private Carrinho carrinho;

	public Carrinho getCarrinho() {
		return carrinho;
	}

	public void setCarrinho(Carrinho carrinho) {
		this.carrinho = carrinho;
	}
	
	

}
