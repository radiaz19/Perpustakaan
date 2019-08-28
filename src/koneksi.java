/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.Connection;
import java.sql.DriverManager;
/**
 *
 * @author Radiaz_5170411265
 */
public class koneksi {
  Connection con;
  
  public Connection getConnection() {
      return con;
  }
  public koneksi(){
      if (con==null){
          try{
              Class.forName("com.mysql.cj.jdbc.Driver");
              con=DriverManager.getConnection("jdbc:mysql://localhoost/perpustakaan","root","");
              System.out.println("Koneksi Sukses");
          }catch(Exception e){
              System.out.println("Koneksi Gagal:"+e);
          }
      }
  }
  
}
