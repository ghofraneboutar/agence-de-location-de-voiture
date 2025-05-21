package dao;

import entities.Parc;
import entities.Voiture;
import utilitaire.Connexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ImpIDaoVoiture implements IDaoVoiture {
    private Connection cnx = Connexion.getConnection();
    private ImpIDaoParc daoParc = new ImpIDaoParc();

    @Override
    public void ajouterVoiture(Voiture voiture) {
        try {
            PreparedStatement query = cnx.prepareStatement("insert into voiture (matricule, modele, marque, kilometrage, num_parc, image) values (?, ?, ?, ?, ?, ?)");
            query.setString(1, voiture.getMatricule());
            query.setString(2, voiture.getModele());
            query.setString(3, voiture.getMarque());
            query.setFloat(4, voiture.getKilometrage());
            query.setInt(5, voiture.getParc().getNum_parc());
            query.setString(6, voiture.getImageUrl());
            query.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void supprimerVoiture(int id) {
        try {
            PreparedStatement query = cnx.prepareStatement("delete from voiture where code_voiture = ?");
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
                Parc parc = daoParc.getParc(rs.getInt("num_parc"));
                Voiture voiture = new Voiture();
                voiture.setCode_voiture(rs.getInt("code_voiture"));
                voiture.setMatricule(rs.getString("matricule"));
                voiture.setModele(rs.getString("modele"));
                voiture.setMarque(rs.getString("marque"));
                voiture.setKilometrage(rs.getFloat("kilometrage"));
                voiture.setParc(parc);
                voiture.setImageUrl(rs.getString("image"));
                voitures.add(voiture);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return voitures;
    }

    @Override
    public Voiture getVoiture(int id) {
        try {
            PreparedStatement query = cnx.prepareStatement("select * from voiture where code_voiture = ?");
            query.setInt(1, id);
            ResultSet rs = query.executeQuery();
            if (rs.next()) {
                Parc parc = daoParc.getParc(rs.getInt("num_parc"));
                return new Voiture(
                        rs.getInt("code_voiture"),
                        rs.getString("matricule"),
                        rs.getString("marque"),
                        rs.getString("modele"),
                        rs.getFloat("kilometrage"),
                        parc,
                        rs.getString("image")
                );
            } else {
                return null;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void modifierVoiture(Voiture voiture) {
        try {
            PreparedStatement query = cnx.prepareStatement(
                    "update voiture set matricule = ?, modele = ?, marque = ?, kilometrage = ?, num_parc = ?, image = ? where code_voiture = ?"
            );
            query.setString(1, voiture.getMatricule());
            query.setString(2, voiture.getModele());
            query.setString(3, voiture.getMarque());
            query.setFloat(4, voiture.getKilometrage());
            query.setInt(5, voiture.getParc().getNum_parc());
            query.setString(6, voiture.getImageUrl());
            query.setInt(7, voiture.getCode_voiture());
            query.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public boolean estVoitureDisponible(int voitureId, Date dateDebut, Date dateFin) {
        try {
            String sql = "SELECT COUNT(*) FROM location " +
                    "WHERE code_voiture = ? " +
                    "AND ((date_debut BETWEEN ? AND ?) " +
                    "OR (date_fin BETWEEN ? AND ?) " +
                    "OR (date_debut <= ? AND date_fin >= ?))";

            PreparedStatement query = cnx.prepareStatement(sql);
            query.setInt(1, voitureId);
            query.setDate(2, new java.sql.Date(dateDebut.getTime()));
            query.setDate(3, new java.sql.Date(dateFin.getTime()));
            query.setDate(4, new java.sql.Date(dateDebut.getTime()));
            query.setDate(5, new java.sql.Date(dateFin.getTime()));
            query.setDate(6, new java.sql.Date(dateDebut.getTime()));
            query.setDate(7, new java.sql.Date(dateFin.getTime()));

            ResultSet rs = query.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count == 0;
            }
            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Voiture> rechercherParMarque(String marque) {
        List<Voiture> resultat = new ArrayList<>();
        try {
            PreparedStatement query = cnx.prepareStatement(
                    "SELECT * FROM voiture WHERE LOWER(marque) LIKE LOWER(?)"
            );
            query.setString(1, "%" + marque + "%");
            ResultSet rs = query.executeQuery();

            while (rs.next()) {
                Parc parc = daoParc.getParc(rs.getInt("num_parc"));
                Voiture voiture = new Voiture(
                        rs.getInt("code_voiture"),
                        rs.getString("matricule"),
                        rs.getString("marque"),
                        rs.getString("modele"),
                        rs.getFloat("kilometrage"),
                        parc,
                        rs.getString("image")
                );
                resultat.add(voiture);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return resultat;
    }

    /**
     * Recherche des voitures par modèle
     * @param modele Le modèle à rechercher
     * @return Liste des voitures correspondant au modèle
     */
    public List<Voiture> rechercherParModele(String modele) {
        List<Voiture> resultat = new ArrayList<>();
        try {
            PreparedStatement query = cnx.prepareStatement(
                    "SELECT * FROM voiture WHERE LOWER(modele) LIKE LOWER(?)"
            );
            query.setString(1, "%" + modele + "%");
            ResultSet rs = query.executeQuery();

            while (rs.next()) {
                Parc parc = daoParc.getParc(rs.getInt("num_parc"));
                Voiture voiture = new Voiture(
                        rs.getInt("code_voiture"),
                        rs.getString("matricule"),
                        rs.getString("marque"),
                        rs.getString("modele"),
                        rs.getFloat("kilometrage"),
                        parc,
                        rs.getString("image")
                );
                resultat.add(voiture);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return resultat;
    }

    /**
     * Recherche des voitures disponibles pour une période donnée
     * @param dateDebut Date de début de la période
     * @param dateFin Date de fin de la période
     * @return Liste des voitures disponibles pour la période
     */
    public List<Voiture> rechercherVoituresDisponibles(Date dateDebut, Date dateFin) {
        List<Voiture> toutesVoitures = getVoitures();
        List<Voiture> voituresDisponibles = new ArrayList<>();

        for (Voiture voiture : toutesVoitures) {
            if (estVoitureDisponible(voiture.getCode_voiture(), dateDebut, dateFin)) {
                voituresDisponibles.add(voiture);
            }
        }

        return voituresDisponibles;
    }

    /**
     * Recherche des voitures par parc
     * @param parcId L'ID du parc à rechercher
     * @return Liste des voitures appartenant au parc
     */
    public List<Voiture> rechercherParParc(int parcId) {
        List<Voiture> resultat = new ArrayList<>();
        try {
            PreparedStatement query = cnx.prepareStatement(
                    "SELECT * FROM voiture WHERE num_parc = ?"
            );
            query.setInt(1, parcId);
            ResultSet rs = query.executeQuery();

            while (rs.next()) {
                Parc parc = daoParc.getParc(rs.getInt("num_parc"));
                Voiture voiture = new Voiture(
                        rs.getInt("code_voiture"),
                        rs.getString("matricule"),
                        rs.getString("marque"),
                        rs.getString("modele"),
                        rs.getFloat("kilometrage"),
                        parc,
                        rs.getString("image")
                );
                resultat.add(voiture);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return resultat;
    }
}