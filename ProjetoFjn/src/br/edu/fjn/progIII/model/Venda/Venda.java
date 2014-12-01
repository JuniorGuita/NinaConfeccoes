package br.edu.fjn.progIII.model.Venda;

import java.util.ArrayList;
import java.util.List;

import br.edu.fjn.progIII.model.Cliente.Cliente;
import br.edu.fjn.progIII.model.Item.Item;

public class Venda {
	private List<Item> itens;
	private double total;
	private Cliente cliente;

	public Venda() {
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

	private void setTotal() {
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

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cliente == null) ? 0 : cliente.hashCode());
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
		Venda other = (Venda) obj;
		if (cliente == null) {
			if (other.cliente != null)
				return false;
		} else if (!cliente.equals(other.cliente))
			return false;
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
