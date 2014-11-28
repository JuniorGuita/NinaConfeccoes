import java.util.Calendar;

import br.edu.fjn.progIII.componentes.UserSession;
import br.edu.fjn.progIII.dao.LogDAO;
import br.edu.fjn.progIII.model.Log.Log;


public class teste {
	public static void main(String[] args) {
		Calendar calendar = null;
		String operacao = "Salvar User";
		
		LogDAO logDAO = new LogDAO();
		Log log = new Log();
		
		log.setNome("junior");
		log.setOperacao(operacao);
		log.setData(calendar.getInstance());
		
		logDAO.salvarLog(log);
		System.out.println("loggggg");
		
	}
}
