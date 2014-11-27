package br.edu.fjn.progIII.controllers;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.edu.fjn.progIII.dao.FornecedorDAO;
import br.edu.fjn.progIII.dao.ProdutoDAO;
import br.edu.fjn.progIII.dao.UsuarioDAO;
import br.edu.fjn.progIII.model.Estado.Estado;
import br.edu.fjn.progIII.model.Fornecedor.Fornecedor;
import br.edu.fjn.progIII.model.Produto.Produto;
import br.edu.fjn.progIII.model.Usuario.Usuario;

/*
 * 
 * @author Antonio Siqueira
 */

@Controller
@Path("produto")
public class ProdutoController {

	@Inject
	private Result result;

	@Get("novo")
	public void form() {

	/*public void form(){
		// result.include(null, null);
*/	}

	@Get("list")
	public void listar() {
		ProdutoDAO produtoDAO = new ProdutoDAO();
		result.include("listarProdutos", produtoDAO.listarProdutos());
	}

	@Post
	public void salvar(Produto produto) {
		ProdutoDAO produtoDao = new ProdutoDAO();
		produtoDao.salvaProduto(produto);
		result.include("message", "Produto " + produto.getNome()
				+ " salvo com sucesso!");
		result.redirectTo(this).form();
	}

	@Get("deletar/{id}")
	public void deletar(int id) {
		ProdutoDAO dao = new ProdutoDAO();
		dao.deletarProduto(id);
		result.redirectTo(this).listar();

	}
	
	@Get("editar/{id}")
	public void editar(int id) {
		ProdutoDAO produtoDAO = new ProdutoDAO();
		Produto produto = produtoDAO.buscaPorId(id);
		result.include("obj", produto);
		result.include("tituloFormulario", "Editar Produto");
	}
	
	@Post("salvar_alteracoes")
	public void salvarAlteracoes(Produto produto){
		ProdutoDAO produtoDAO = new ProdutoDAO();
		produtoDAO.editar(produto);
		result.redirectTo(this).editar(produto.getId());
	}
	
}
