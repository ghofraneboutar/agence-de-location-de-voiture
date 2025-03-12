package dao;

import entities.Client;
import utilitaire.Connexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class ImpIDaoClient implements IDaoClient {
    private Connection cnx = Connexion.getConnection();


    @Override
    public void ajouterClient(Client client) {
        try {
            PreparedStatement query = cnx.prepareStatement("insert into client values (null,?,?,?,?,?,?,?,?)");
            query.setString(1, client.getNum_cin());
            query.setString(2, client.getNom());
            query.setString(3, client.getPrenom());
            query.setInt(4, client.getAge());
            query.setString(5, client.getAdresse());
            query.setString(6, client.getNum_permis());
            query.setString(7, client.getEmail());
            query.setString(8, client.getTel());
            query.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void supprimerClient(int id) {

    }

    @Override
    public void modifierClient(Client client) {

    }

    @Override
    public Client getClient(int id) {
        return null;
    }

    @Override
    public ArrayList<Client> getClients() {
        return null;
    }
}
