package cuarentena;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class Conector1 {
	private static Connection con;
	private static Conector1 INSTANCE = null;

	private Conector1() {
	}

	private synchronized static void crearInstancia() {
		if (INSTANCE == null) {
			INSTANCE = new Conector1();
			crearConexion();
		}
	}

	public static Conector1 getInstancia() {
		if (INSTANCE == null) {
			crearInstancia();
		}
		return INSTANCE;
	}

	private static void crearConexion() {
		//Ejercicio 1 y 2
		String host = "127.0.0.1";
		String user = "alebd1";
		String password = "Alejandra.123";
		String dataBase = "cuarentena2";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String urlConexion = "jdbc:mysql://" + host + "/" + dataBase + "?user=" + user + "&password=" + password;
			con = DriverManager.getConnection(urlConexion);
			System.out.println("Lo lograste <3");
		} catch (Exception e) {
			System.out.println("Error al conectar a la base de datos");
			System.out.println(e);
		}
	}
		
	public ArrayList<String> getPacientes() throws SQLException {
		ArrayList<String> listaPacientes = new ArrayList<String>();
		PreparedStatement ps = con.prepareStatement("Select * from persona");
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			listaPacientes.add(rs.getString("nombres"));
		}
		rs.close();
		return listaPacientes;
	}
	
	public ArrayList<String> getNombresYConsul() throws SQLException{
		ArrayList<String> listaNomYConsul=new ArrayList<String>();
		PreparedStatement ps =con.prepareStatement("select nombres, consultorio.nro from persona inner join doctor on persona.CI= doctor.personaID inner join consultorio on doctor.consultorioID=consultorio.ID;");
		ResultSet rs= ps.executeQuery();
		while (rs.next()){
			listaNomYConsul.add(rs.getString("nombres"));
			listaNomYConsul.add(rs.getString("consultorio.nro"));
			
		}
		rs.close();
		return listaNomYConsul;
	}

}


