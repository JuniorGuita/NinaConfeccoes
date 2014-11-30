package br.edu.fjn.progIII.controllers;

import java.util.Calendar;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.edu.fjn.progIII.annotations.Public;
import br.edu.fjn.progIII.componentes.UserSession;
import br.edu.fjn.progIII.dao.LogDAO;
import br.edu.fjn.progIII.dao.loginDAO;
import br.edu.fjn.progIII.model.Log.Log;
import br.edu.fjn.progIII.model.Usuario.Usuario;

/*
 * 
 * @author Antonio Siqueira
 */

@Controller
public class loginController {
	
	@Inject
	private Result result;
	
	@Inject
	private UserSession userSession;
	
	private Calendar calendar;
	
	@Public
	@Get("/")
	public void form(){
		
	}
	
	@Public
	@Post("login")
	public void login(Usuario usuario){
		loginDAO loginDao = new loginDAO();
		if(loginDao.validarLogin(usuario.getNome(), usuario.getPass())){
			userSession.setUsuario(usuario);
			
			LogDAO logDAO = new LogDAO();
			Log log = new Log();
			log.setNome(userSession.getUsuario().getNome());
			log.setOperacao("Logou no Sistema");
			log.setData(calendar.getInstance());
			logDAO.salvarLog(log);
			
			result.redirectTo(indexController.class).index();
		}else{
			System.out.println(usuario.getNome());
			System.out.println(usuario.getPass());
			result.include("message", "Usuário ou senha inválidos");
			result.redirectTo(this).form();
		}	
	}
	
	@Get("sair")
	public void logout(){
		userSession.logout();
		result.redirectTo(loginController.class).form();
	}
}
