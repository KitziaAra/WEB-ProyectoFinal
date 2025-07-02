package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class base {
    private String usrBD;
    private String passBD;
    private String urlBD;
    private String driverClassName;
    private Connection conn = null;
    private Statement estancia;   
    public base(){
        this.usrBD = "root";
        this.passBD = "1q2w3e4r5t6y7u8i9o0p";  
        this.urlBD = "jdbc:mysql://127.0.0.1:3306/TORNEOS";///?useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC
        this.driverClassName = "com.mysql.jdbc.Driver";
    }

    public void setUsrBD(String usrBD) {
        this.usrBD = usrBD;
    }

    public void setPassBD(String passBD) {
        this.passBD = passBD;
    }

    public void setUrlBD(String urlBD) {
        this.urlBD = urlBD;
    }

    public void setDriverClassName(String driverClassName) {
        this.driverClassName = driverClassName;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }

    public void setEstancia(Statement estancia) {
        this.estancia = estancia;
    }

    public void conectar() throws SQLException, ClassNotFoundException {
        try{
            Class.forName(this.driverClassName) .newInstance();
            this.conn = DriverManager.getConnection(this.urlBD, this.usrBD, this.passBD);
        } catch (Exception err) {
            System.out.println("Error "+err.getMessage());
        }
    }
    public void cierraConexion() throws SQLException {
         this.conn.close();
    }
    public int insertar(String inserta) throws SQLException {
        Statement st = (Statement) this.conn.createStatement();
        return st.executeUpdate(inserta);
    }        
    public ResultSet consulta(String consulta) throws SQLException{
        this.estancia = (Statement) conn.createStatement();
        return this.estancia.executeQuery(consulta);
    }
    public int borrar(String borra) throws SQLException {
        Statement st = (Statement) this.conn.createStatement();
        return st.executeUpdate(borra);
    }
    public int edita(String editar) throws SQLException {
        Statement st = (Statement) this.conn.createStatement();
        return st.executeUpdate(editar);
    }
}