import java.text.SimpleDateFormat;
import java.util.Date;



public class teste {
	public static void main(String[] args) {
	
		Date data = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd/mm/yyyy");
		String data2 = sdf.format(data);
		System.out.println(data2);
		
	}
}
