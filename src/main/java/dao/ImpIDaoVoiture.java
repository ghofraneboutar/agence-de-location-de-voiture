package dao;

import entities.Voiture;
import utilitaire.Connexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ImpIDaoVoiture implements IDaoVoiture {
    private Connection cnx = Connexion.getConnection();

    @Override
    public void ajouterVoiture(Voiture voiture) {
        try {
            PreparedStatement query = cnx.prepareStatement("insert into voiture values(null,?,?,?,?,?)");
            query.setString(1, voiture.getMatricule());
            query.setString(2,voiture.getModele());
            query.setString(3, voiture.getMarque());
            query.setFloat(4,voiture.getKilometrage());
            query.setInt(5,voiture.getParc().getNum_parc());
            query.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);

        }

    }

    @Override
    public void supprimerVoiture(int id) {
        try{
            PreparedStatement query= cnx.prepareStatement("delete from voiture where id=?");
            query.setInt(1, id);
            query.executeUpdate();

        }catch (SQLException e){
            throw new RuntimeException(e);
        }

    }

    @Override
    public ArrayList<Voiture> getVoitures() {
        ArrayList<Voiture> voitures = new ArrayList<>();
        try{
            PreparedStatement query=cnx.prepareStatement("select * from voiture");
            ResultSet rs=query.executeQuery();
            while(rs.next()){

            }

        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return voitures;
    }

    @Override
    public Voiture getVoiture(int id) {
        return null;
    }

    @Override
    public void modifierVoiture(Voiture voiture) {

    }
}
