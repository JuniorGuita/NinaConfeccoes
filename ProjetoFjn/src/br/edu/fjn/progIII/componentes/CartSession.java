package br.edu.fjn.progIII.componentes;

import java.io.Serializable;

import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

import br.edu.fjn.progIII.model.Item.Item;
import br.edu.fjn.progIII.model.Produto.Produto;
import br.edu.fjn.progIII.model.Venda.Venda;

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
	private Venda venda = new Venda();

	public CartSession() {
	}

	public Venda getVenda() {
		return venda;
	}

	public void setVenda(Venda venda) {
		this.venda = venda;
	}

	public void addVenda(Item item) {
		this.verificaVenda();
		System.out.println("[CartSession] adicionar novo item ao carrinho");
		this.venda.addItem(item);
	}

	public void removeItem(int chave) {
		this.venda.remove(chave);
	}

	private void verificaVenda() {
		if (this.venda == null) {
			this.venda = new Venda();
		}
	}

}
