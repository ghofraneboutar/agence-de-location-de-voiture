package dao;

import entities.Client;
import entities.Location;
import entities.Voiture;
import utilitaire.Connexion;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ImplDaoLocation implements IDaoLocation {
    private Connection cnx = Connexion.getConnection();
    private ImpIDaoClient daoClient = new ImpIDaoClient();
    private ImpIDaoVoiture daoVoiture = new ImpIDaoVoiture();

    @Override
    public void ajouterLocation(Location location) {
        try {
            PreparedStatement query = cnx.prepareStatement(
                    "INSERT INTO location (code_client, code_voiture, date_debut, date_fin) VALUES (?, ?, ?, ?)",
                    Statement.RETURN_GENERATED_KEYS
            );
            query.setInt(1, location.getClient().getCode_client());
            query.setInt(2, location.getVoiture().getCode_voiture());
            query.setDate(3, new java.sql.Date(location.getDate_debut().getTime()));
            query.setDate(4, new java.sql.Date(location.getDate_fin().getTime()));

            query.executeUpdate();

            ResultSet generatedKeys = query.getGeneratedKeys();
            if (generatedKeys.next()) {
                location.setCode_location(generatedKeys.getInt(1));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void supprimerLocation(int id) {
        try {
            PreparedStatement query = cnx.prepareStatement("DELETE FROM location WHERE code_location = ?");
            query.setInt(1, id);
            query.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void modifierLocation(Location location) {
        try {
            PreparedStatement query = cnx.prepareStatement(
                    "UPDATE location SET code_client = ?, code_voiture = ?, date_debut = ?, date_fin = ?, statut = ? WHERE code_location = ?"
            );
            query.setInt(1, location.getClient().getCode_client());
            query.setInt(2, location.getVoiture().getCode_voiture());
            query.setDate(3, new java.sql.Date(location.getDate_debut().getTime()));
            query.setDate(4, new java.sql.Date(location.getDate_fin().getTime()));
            query.setInt(5, location.getCode_location());
            query.setString(6, location.getStatut());

            query.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Location getLocation(int id) {
        try {
            PreparedStatement query = cnx.prepareStatement("SELECT * FROM location WHERE code_location = ?");
            query.setInt(1, id);
            ResultSet rs = query.executeQuery();

            if (rs.next()) {
                Client client = daoClient.getClient(rs.getInt("code_client"));
                Voiture voiture = daoVoiture.getVoiture(rs.getInt("code_voiture"));

                Location location = new Location(client, voiture, rs.getDate("date_debut"), rs.getDate("date_fin"));
                location.setCode_location(rs.getInt("code_location"));
                location.setClient(client);
                location.setVoiture(voiture);
                location.setDate_debut(rs.getDate("date_debut"));
                location.setDate_fin(rs.getDate("date_fin"));
                location.setStatut(rs.getString("statut"));

                return location;
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public ArrayList<Location> getLocations() {
        ArrayList<Location> locations = new ArrayList<>();
        try {
            PreparedStatement query = cnx.prepareStatement("SELECT * FROM location ORDER BY date_debut DESC");
            ResultSet rs = query.executeQuery();

            while (rs.next()) {
                Client client = daoClient.getClient(rs.getInt("code_client"));
                Voiture voiture = daoVoiture.getVoiture(rs.getInt("code_voiture"));

                Location location = new Location(client, voiture, rs.getDate("date_debut"), rs.getDate("date_fin"));
                location.setCode_location(rs.getInt("code_location"));
                location.setClient(client);
                location.setVoiture(voiture);
                location.setDate_debut(rs.getDate("date_debut"));
                location.setDate_fin(rs.getDate("date_fin"));
                location.setStatut(rs.getString("statut"));

                locations.add(location);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return locations;
    }

    @Override
    public List<Location> getLocationsByClient(int clientId) {
        List<Location> locations = new ArrayList<>();
        try {
            PreparedStatement query = cnx.prepareStatement("SELECT * FROM location WHERE code_client = ? ORDER BY date_debut DESC");
            query.setInt(1, clientId);
            ResultSet rs = query.executeQuery();

            while (rs.next()) {
                Client client = daoClient.getClient(rs.getInt("code_client"));
                Voiture voiture = daoVoiture.getVoiture(rs.getInt("code_voiture"));

                Location location = new Location(client, voiture, rs.getDate("date_debut"), rs.getDate("date_fin"));
                location.setCode_location(rs.getInt("code_location"));
                location.setClient(client);
                location.setVoiture(voiture);
                location.setDate_debut(rs.getDate("date_debut"));
                location.setDate_fin(rs.getDate("date_fin"));
                location.setStatut(rs.getString("statut"));

                locations.add(location);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return locations;
    }

    @Override
    public List<Location> getLocationsByVoiture(int voitureId) {
        List<Location> locations = new ArrayList<>();
        try {
            PreparedStatement query = cnx.prepareStatement("SELECT * FROM location WHERE code_voiture = ? ORDER BY date_debut DESC");
            query.setInt(1, voitureId);
            ResultSet rs = query.executeQuery();

            while (rs.next()) {
                Client client = daoClient.getClient(rs.getInt("code_client"));
                Voiture voiture = daoVoiture.getVoiture(rs.getInt("code_voiture"));

                Location location = new Location(client, voiture, rs.getDate("date_debut"), rs.getDate("date_fin"));
                location.setCode_location(rs.getInt("code_location"));
                location.setClient(client);
                location.setVoiture(voiture);
                location.setDate_debut(rs.getDate("date_debut"));
                location.setDate_fin(rs.getDate("date_fin"));
                location.setStatut(rs.getString("statut"));
                locations.add(location);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return locations;
    }

    @Override
    public List<Location> getLocationsByPeriode(Date dateDebut, Date dateFin) {
        List<Location> locations = new ArrayList<>();
        try {
            PreparedStatement query = cnx.prepareStatement(
                    "SELECT * FROM location WHERE (date_debut BETWEEN ? AND ?) OR (date_fin BETWEEN ? AND ?) ORDER BY date_debut DESC"
            );
            query.setDate(1, new java.sql.Date(dateDebut.getTime()));
            query.setDate(2, new java.sql.Date(dateFin.getTime()));
            query.setDate(3, new java.sql.Date(dateDebut.getTime()));
            query.setDate(4, new java.sql.Date(dateFin.getTime()));

            ResultSet rs = query.executeQuery();

            while (rs.next()) {
                Client client = daoClient.getClient(rs.getInt("code_client"));
                Voiture voiture = daoVoiture.getVoiture(rs.getInt("code_voiture"));

                Location location = new Location(client, voiture, rs.getDate("date_debut"), rs.getDate("date_fin"));
                location.setCode_location(rs.getInt("code_location"));
                location.setClient(client);
                location.setVoiture(voiture);
                location.setDate_debut(rs.getDate("date_debut"));
                location.setDate_fin(rs.getDate("date_fin"));
                location.setStatut(rs.getString("statut"));

                locations.add(location);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return locations;
    }

    @Override
    public boolean estVoitureDisponible(int voitureId, Date dateDebut, Date dateFin) {
        try {
            // Requête SQL pour vérifier s'il existe des locations pour cette voiture pendant la période
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
}