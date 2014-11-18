package br.edu.fjn.progIII.componentes;

import java.io.Serializable;

import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

import br.edu.fjn.progIII.model.Usuario.Usuario;

/*
 * 
 * @author Antonio Siqueira
 */

@SessionScoped
@Named("sessionUser")
public class UserSession implements Serializable {

	private Usuario usuario;

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	public boolean isLogged(){
		return usuario!=null;
	}
	
	public void logout(){
		usuario = null;
	}
}

