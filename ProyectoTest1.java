package futuro;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;

import org.junit.After;
import org.junit.Before;
import org.junit.jupiter.api.Test;

//Test para contar elementos de una tabla pasada por parametro
class ProyectoTest1 {
	private BDcontroller bc;
	private int resultado;
	
	@Before
	void crearBDController() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		bc  = new BDcontroller();
	}
	
	@After
	void borrarBDController() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		bc  = null;
	}

	@Test
	void test1() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		bc  = new BDcontroller();
		resultado=bc.contarElementos("candidatos");
		assertEquals(47, resultado);
	}
	
	@Test
	void test2() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		bc  = new BDcontroller();
		resultado=bc.contarElementos("eventos");
		assertEquals(16, resultado);
	}
	
	@Test
	void test3() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		bc  = new BDcontroller();
		resultado=bc.contarElementos("campanna");
		assertEquals(22, resultado);
	}
}
