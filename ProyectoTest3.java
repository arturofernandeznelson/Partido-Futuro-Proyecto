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

//Test para conseguir la comunidad Autonoma de un candidato pasado por parametro
@RunWith(Parameterized.class)
public class ProyectoTest3 {
	private int cod_candidato;
	private String resultado;
	
	public ProyectoTest3(int cod_candidato,String resultado){		
		this.cod_candidato=cod_candidato;
		this.resultado=resultado;
	}
	
	@Parameters
	public static List<Object[]> codigosCandidatos(){
		return Arrays.asList(new Object[][] {
			{1,"Comunidad de Madrid"},{17,"Galicia"},{39,"País Vasco"}
		});
	}

	@Test
	public void test() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		BDcontroller bc= new BDcontroller();
		String res=bc.autonomiaCandidato(cod_candidato);
		assertEquals(resultado,res);
		
	}

}