package dao;

import entities.Client;
import entities.Location;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public interface IDaoLocation {
    void ajouterLocation(Location location);
    void supprimerLocation(int id);
    void modifierLocation(Location location);
    Location getLocation(int id);
    ArrayList<Location> getLocations();
    List<Location> getLocationsByClient(int clientId);
    List<Location> getLocationsByVoiture(int voitureId);
    List<Location> getLocationsByPeriode(Date dateDebut, Date dateFin);
    boolean estVoitureDisponible(int voitureId, Date dateDebut, Date dateFin);
}
