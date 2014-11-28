package br.edu.fjn.progIII.controllers;

import java.util.Calendar;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.edu.fjn.progIII.componentes.UserSession;
import br.edu.fjn.progIII.dao.LogDAO;
import br.edu.fjn.progIII.dao.ProdutoDAO;
import br.edu.fjn.progIII.dao.UsuarioDAO;
import br.edu.fjn.progIII.model.Log.Log;
import br.edu.fjn.progIII.model.Produto.Produto;
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
	
	@Inject
	private UserSession user;
	
	private Calendar calendar;
	
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
			LogDAO logDAO = new LogDAO();
			Log log = new Log();
			
			log.setNome(user.getUsuario().getNome());
			log.setOperacao("Salvou Usuário");
			log.setData(calendar.getInstance());
			logDAO.salvarLog(log);
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
	
	@Get("deletar/{id}")
	public void deletar(int id) {
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		usuarioDAO.deletarUsuario(id);
		
		LogDAO logDAO = new LogDAO();
		Log log = new Log();
		log.setNome(user.getUsuario().getNome());
		log.setOperacao("Deletou Usuário");
		log.setData(calendar.getInstance());
		logDAO.salvarLog(log);
		
		result.redirectTo(this).listar();
	}
	
	
	@Get("editar/{id}")
	public void editar(int id) {
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		Usuario usuario = usuarioDAO.buscaPorId(id);
		result.include("obj", usuario);
		result.include("tituloFormulario", "Editar Usuário");
	}
	
	@Post("salvar_alteracoes")
	public void salvarAlteracoes(Usuario usuario){
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		usuarioDAO.editar(usuario);
		
		LogDAO logDAO = new LogDAO();
		Log log = new Log();	
		log.setNome(user.getUsuario().getNome());
		log.setOperacao("Editou Usuário");
		log.setData(calendar.getInstance());
		logDAO.salvarLog(log);
		
		result.redirectTo(this).editar(usuario.getId());
	}
	
}
