package br.edu.fjn.progIII.model.Carrinho;

import java.util.ArrayList;
import java.util.List;

import br.edu.fjn.progIII.model.Item.Item;

public class Carrinho {
	private List<Item> itens;
	private double total;

	public Carrinho() {
		this.itens = new ArrayList<Item>();
	}

	public List<Item> getItens() {
		return itens;
	}

	public void setItens(List<Item> itens) {
		this.itens = itens;
	}

	public double getTotal() {
		this.setTotal();
		return this.total;
	}

	public void setTotal() {
		this.total = 0;
		for (Item item : itens) {
			this.total += item.getProduto().getValor() * item.getQuantidade();
		}
	}

	public void addItem(Item item) {
		this.itens.add(item);
	}

	public void remove(int chave) {
		this.itens.remove(chave);
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((itens == null) ? 0 : itens.hashCode());
		long temp;
		temp = Double.doubleToLongBits(total);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Carrinho other = (Carrinho) obj;
		if (itens == null) {
			if (other.itens != null)
				return false;
		} else if (!itens.equals(other.itens))
			return false;
		if (Double.doubleToLongBits(total) != Double
				.doubleToLongBits(other.total))
			return false;
		return true;
	}

}
