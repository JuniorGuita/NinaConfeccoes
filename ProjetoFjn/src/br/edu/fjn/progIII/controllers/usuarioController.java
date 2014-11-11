package br.edu.fjn.progIII.controllers;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.edu.fjn.progIII.dao.UsuarioDAO;
import br.edu.fjn.progIII.model.Usuario;

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
		UsuarioDAO salvar = new UsuarioDAO();
		salvar.salvaUsuario(usuario);
		result.include("message", "Usuário "+usuario.getNome() + " incluído com sucesso!");
		result.redirectTo(this).form();
	}
}
