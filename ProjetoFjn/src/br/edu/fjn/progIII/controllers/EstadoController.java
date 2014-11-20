package br.edu.fjn.progIII.controllers;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.edu.fjn.progIII.dao.EstadoDAO;
import br.edu.fjn.progIII.model.Estado.Estado;

@Controller
@Path("estado")
public class EstadoController {

	@Inject
	private Result result;

	@Get("json")
	public List<Estado> json() {
		List<Estado> estados = null;
		try {
			EstadoDAO estadoDAO = new EstadoDAO();
			estados = estadoDAO.getEstados();
		} catch (Exception e) {
			System.out.print("ERROR :::::::::: ");
			e.printStackTrace();
		}
		return estados;
	}
}
