/*package br.edu.fjn.progIII.intercepts;

import javax.inject.Inject;

import br.com.caelum.vraptor.InterceptionException;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.controller.ControllerMethod;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;
import br.edu.fjn.progIII.annotations.Public;
import br.edu.fjn.progIII.componentes.UserSession;
import br.edu.fjn.progIII.controllers.loginController;

@Intercepts
public class AuthenticationIntercept implements Interceptor {

	
	private UserSession userSession;
	private Result result;
			
	@Inject
    public AuthenticationIntercept(UserSession userSession, Result result) {
		super();
		this.userSession = userSession;
		this.result = result;
	}

	// Necessário para o CDI	
	AuthenticationIntercept(){
		
	}

	@Override
	public boolean accepts(ControllerMethod cm) {
		return !(cm.getMethod().isAnnotationPresent(Public.class) ||
	          	  cm.getController().getType().isAnnotationPresent(Public.class));
	}

	@Override
	public void intercept(InterceptorStack is, ControllerMethod cm,
			Object object) throws InterceptionException {
		System.out.println("oi interceptor intercept");
		if (userSession.isLogged()){  
            is.next(cm, object);
		} else {
			result.redirectTo(loginController.class).form();
		}
		
	}

}
*/