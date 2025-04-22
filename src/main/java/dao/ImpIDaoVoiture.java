package dao;

import entities.Parc;
import entities.Voiture;
import utilitaire.Connexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ImpIDaoVoiture implements IDaoVoiture {
    private Connection cnx = Connexion.getConnection();
    private ImpIDaoParc daoParc = new ImpIDaoParc();

    @Override
    public void ajouterVoiture(Voiture voiture) {
        try {
            PreparedStatement query = cnx.prepareStatement("insert into voiture values(null,?,?,?,?,?)");
            query.setString(1, voiture.getMatricule());
            query.setString(2, voiture.getModele());
            query.setString(3, voiture.getMarque());
            query.setFloat(4, voiture.getKilometrage());
            query.setInt(5, voiture.getParc().getNum_parc());
            query.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);

        }

    }

    @Override
    public void supprimerVoiture(int id) {
        try {
            PreparedStatement query = cnx.prepareStatement("delete from voiture where code_voiture=?");
            query.setInt(1, id);
            query.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public ArrayList<Voiture> getVoitures() {
        ArrayList<Voiture> voitures = new ArrayList<>();
        try {
            PreparedStatement query = cnx.prepareStatement("select * from voiture");
            ResultSet rs = query.executeQuery();
            while (rs.next()) {
                Parc parc = new Parc();
                parc = daoParc.getParc(rs.getInt("num_parc"));
                Voiture voiture = new Voiture();
                voiture.setCode_voiture(rs.getInt("code_voiture"));
                voiture.setMatricule(rs.getString("matricule"));
                voiture.setModele(rs.getString("modele"));
                voiture.setMarque(rs.getString("marque"));
                voiture.setKilometrage(rs.getFloat("kilometrage"));
                voiture.setParc(parc);
                voitures.add(voiture);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return voitures;
    }

    @Override
    public Voiture getVoiture(int id) {
        Voiture voiture = null;
        try {
            PreparedStatement query = cnx.prepareStatement("select * from voiture where code_voiture=?");
            query.setInt(1, id);
            ResultSet rs = query.executeQuery();
            while (rs.next()) {
                Parc parc = new Parc();
                parc = daoParc.getParc(rs.getInt("num_parc"));
                voiture.setParc(parc);
                voiture = new Voiture();
                voiture.setCode_voiture(rs.getInt("code_voiture"));
                voiture.setModele(rs.getString("modele"));
                voiture.setMarque(rs.getString("marque"));
                voiture.setKilometrage(rs.getFloat("kilometrage"));
                voiture.setMatricule(rs.getString("matricule"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return voiture;
    }

    @Override
    public void modifierVoiture(Voiture voiture) {
        try {
            PreparedStatement query = this.cnx.prepareStatement("update voiture set matricule=?,modele=? ,marque=?,kilomertrage=? ,num_parc=? where code_voiture=?");
            query.setString(1, voiture.getMatricule());
            query.setString(2, voiture.getModele());
            query.setString(3, voiture.getMarque());
            query.setFloat(4, voiture.getKilometrage());
            query.setInt(5, voiture.getParc().getNum_parc());
            query.setInt(6, voiture.getCode_voiture());
            query.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
