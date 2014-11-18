package br.edu.fjn.progIII.controllers;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.edu.fjn.progIII.dao.UsuarioDAO;
import br.edu.fjn.progIII.model.Usuario.Usuario;

/*
 * 
 * @author Antonio Siqueira
 */

@Controller
@Path("usuario")
public class usuarioController {

	@Inject
	private Result result;
	
	@Get("novo")
	public void form(){
		
	}
	
	@Get("list")
	public void listar(){
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		result.include("listarUsuarios", usuarioDAO.listarUsuarios());
	}
	
	
	@Post
	public void salvar(Usuario usuario){
		try {
			UsuarioDAO salvar = new UsuarioDAO();
			salvar.salvaUsuario(usuario);
			result.include("status", true);
			result.include("message", "Usu�rio Salvo!");
			result.include("classeCss", "alert alert-success");
		} catch (Exception e) {
			result.include("status", false);
			result.include("message", "N�o foi poss�vel salvar o usu�rio!");
			result.include("classeCss", "alert alert-warning");
		}
		result.redirectTo(this).form();
	}
	
	
	@Get("deletar/{id}")
	public void deletar(int id){
		UsuarioDAO dao = new UsuarioDAO();
		dao.deletarUsuario(id);
		result.redirectTo(this).listar();
	}
	
}
