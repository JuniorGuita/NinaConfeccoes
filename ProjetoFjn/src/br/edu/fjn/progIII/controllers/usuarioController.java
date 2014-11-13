package br.edu.fjn.progIII.controllers;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.edu.fjn.progIII.dao.UsuarioDAO;
import br.edu.fjn.progIII.model.Usuario;

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
	
	@Post
	public void salvar(Usuario usuario){
		try {
			UsuarioDAO salvar = new UsuarioDAO();
			salvar.salvaUsuario(usuario);
			result.include("status", true);
			result.include("message", "Usuário Salvo!");
			result.include("classeCss", "alert alert-success");
		} catch (Exception e) {
			result.include("status", false);
			result.include("message", "Não foi possível salvar o usuário!");
			result.include("classeCss", "alert alert-warning");
		}
		result.redirectTo(this).form();
	}
}
