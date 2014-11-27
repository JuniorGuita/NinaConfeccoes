import br.edu.fjn.progIII.dao.LogDAO;
import br.edu.fjn.progIII.model.Log.Log;


public class teste {
	public static void main(String[] args) {
		
		LogDAO logDAO = new LogDAO();
		Log log = new Log();
		
		log.setNome("teste");
		log.setOperacao("salvou usuario");
		log.setData("teste");
		
		logDAO.salvarLog(log);
		System.out.println("loggggg");
		
	}
}
