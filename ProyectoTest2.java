package futuro;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;

//Test para comprobar si existe un candidato pasado por parametro
@RunWith(Parameterized.class)
public class ProyectoTest2 {
	private int cod_candidato;
	private boolean resultado;
	
	public ProyectoTest2(int cod_candidato,boolean resultado){		
		this.cod_candidato=cod_candidato;
		this.resultado=resultado;
	}
	
	@Parameters
	public static List<Object[]> codigosCandidatos(){
		return Arrays.asList(new Object[][] {
			{1,true},{2,true},{3,true}
		});
	}

	@Test
	public void test() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		BDcontroller bc= new BDcontroller();
		boolean res=bc.exiseCandidato(cod_candidato);
		assertEquals(resultado,res);
		
	}

}
