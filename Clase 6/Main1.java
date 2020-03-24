package cuarentena;

import java.sql.SQLException;
import java.util.ArrayList;

import cuarentena.Conector1;

public class Main1 {

	public static void main(String[] args) {
		Conector1 instancia = Conector1.getInstancia();
		try {
			ArrayList<String>listPacientes = instancia.getPacientes();
			System.out.println("Ejercicio 4: ");
			System.out.println("Nombres de los pacientes: ");
			for(String nombres:listPacientes) {
				System.out.println(nombres);
			}
			System.out.println("----------------------");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			ArrayList<String>listNomYConsul = instancia.getNombresYConsul();
			System.out.println("Ejercicio 5: ");
			System.out.println("Nombres y consultorios:");
			int count = 0; 
			for(String nombreYconsul:listNomYConsul) {
				System.out.println(nombreYconsul + " ");
				count ++; 
				if (count==2) {
					System.out.println();
					count=0; 
				}
			}
			System.out.println("--------------------");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
