package utilitaire;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connexion {
    private static Connection cnx = null;

    private Connexion() {
        // Empêche l'instanciation
    }

    public static Connection getConnection() {
        if (cnx == null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver"); // ✅ MySQL Driver
                String url = "jdbc:mysql://localhost:3306/parcjee?useSSL=false&serverTimezone=UTC";
                String username = "root";
                String password = ""; // Modifie si ton mot de passe MySQL n'est pas vide
                cnx = DriverManager.getConnection(url, username, password);
                System.out.println("✅ MySQL database connected!");
            } catch (ClassNotFoundException e) {
                System.err.println("❌ MySQL JDBC Driver not found: " + e.getMessage());
            } catch (SQLException e) {
                System.err.println("❌ Connection to MySQL failed: " + e.getMessage());
            }
        }
        return cnx;
    }

    public static void closeConnection() {
        if (cnx != null) {
            try {
                cnx.close();
                cnx = null;
                System.out.println("🔴 MySQL connection closed.");
            } catch (SQLException e) {
                System.err.println("⚠️ Failed to close MySQL connection: " + e.getMessage());
            }
        }
    }
}
