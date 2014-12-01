package br.edu.fjn.progIII.model.Venda;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import br.edu.fjn.progIII.model.Cliente.Cliente;
import br.edu.fjn.progIII.model.Item.Item;

@Entity
public class Venda {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "venda_seq")
	@SequenceGenerator(name = "venda_seq", sequenceName = "venda_seq", initialValue = 1, allocationSize = 1)
	private Integer id;
	
	@JoinColumn
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<Item> itens;
	
	@JoinColumn
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Cliente cliente;
	
	@Column(nullable = false)
	private double total;

	//private Calendar data;

	public Venda() {
		this.itens = new ArrayList<Item>();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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



	public void setTotal(double total) {
		this.total = total;
	}


}
