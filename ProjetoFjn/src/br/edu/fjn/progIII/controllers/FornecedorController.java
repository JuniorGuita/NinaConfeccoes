/**
 * @author Fransuelio Nobre
 * 
 * Controller para Fornecedores
 */

package br.edu.fjn.progIII.controllers;

import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.edu.fjn.progIII.componentes.UserSession;
import br.edu.fjn.progIII.dao.FornecedorDAO;
import br.edu.fjn.progIII.dao.LogDAO;
import br.edu.fjn.progIII.dao.ProdutoDAO;
import br.edu.fjn.progIII.model.Estado.Estado;
import br.edu.fjn.progIII.model.Fornecedor.Fornecedor;
import br.edu.fjn.progIII.model.Log.Log;
import br.edu.fjn.progIII.model.Produto.Produto;

@Controller
@Path("fornecedor")
public class FornecedorController {

	@Inject
	private Result result;
	
	@Inject
	private UserSession user;
	
	private Calendar calendar;

	@Get("novo")
	public void form() {
		EstadoController estadoController = new EstadoController();
		List<Estado> estados = estadoController.json();
		result.include("tituloFormulario", "Cadastrar Fornecedor");
		result.include("estados", estados);
	}

	@Post("salvar")
	public void salvar(Fornecedor fornecedor) {
		FornecedorDAO fornecedorDAO = new FornecedorDAO();
		fornecedorDAO.salvarFornecedor(fornecedor);
		
		LogDAO logDAO = new LogDAO();
		Log log = new Log();
		log.setNome(user.getUsuario().getNome());
		log.setOperacao("Salvou Fornecedor");
		log.setData(calendar.getInstance());
		logDAO.salvarLog(log);
		
		result.include("tituloFormulario", "Cadastrar Fornecedor");
		result.include("message", "Fornecedor " + fornecedor.getNome()
				+ " cadastrado com sucesso!");
		result.redirectTo(this).form();
	}

	@Get("editar/{id}")
	public void editar(int id) {
		FornecedorDAO fornecedorDAO = new FornecedorDAO();
		Fornecedor fornecedor = fornecedorDAO.buscaPorId(id);
		EstadoController estadoController = new EstadoController();
		List<Estado> estados = estadoController.json();
		
		result.include("estados", estados);
		result.include("obj", fornecedor);
		result.include("tituloFormulario", "Editar Fornecedor");
	}
	
	@Post("salvar_alteracoes")
	public void salvarAlteracoes(Fornecedor fornecedor){
		FornecedorDAO fornecedorDAO = new FornecedorDAO();
		fornecedorDAO.editar(fornecedor);
		
		LogDAO logDAO = new LogDAO();
		Log log = new Log();
		log.setNome(user.getUsuario().getNome());
		log.setOperacao("Editou Fornecedor");
		log.setData(calendar.getInstance());
		logDAO.salvarLog(log);
		
		result.redirectTo(this).editar(fornecedor.getId());
	}

	@Get("deletar/{id}")
	public void deletar(int id) {
		FornecedorDAO fornecedorDAO = new FornecedorDAO();
		fornecedorDAO.deletarFornecedor(id);
		
		LogDAO logDAO = new LogDAO();
		Log log = new Log();
		log.setNome(user.getUsuario().getNome());
		log.setOperacao("Deletou Fornecedor");
		log.setData(calendar.getInstance());
		logDAO.salvarLog(log);
		
		result.redirectTo(this).listar();
	}

	@Get("list")
	public void listar() {
		FornecedorDAO fornecedorDAO = new FornecedorDAO();
		List<Fornecedor> fornecedores = fornecedorDAO.listarFornecedor();
		result.include("fornecedores", fornecedores);
	}

	@Get("busca/")
	public void busca(String string){
		FornecedorDAO fornecedorDAO = new FornecedorDAO();
		List<Fornecedor> fornecedores = fornecedorDAO.busca(string);
		result.include("fornecedores", fornecedores);
		result.include("registros", fornecedores.size());
	}
	
}
