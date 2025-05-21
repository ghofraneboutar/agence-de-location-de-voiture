package controller;

import entities.Client;
import entities.Location;
import entities.Voiture;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelClient;
import model.ModelVoiture;
import dao.ImplDaoLocation;
import dao.ImpIDaoClient;
import dao.ImpIDaoVoiture;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "location", value = {"/location", "/location/add", "/location/save", "/location/delete", "/location/update", "/location/updating", "/location/list", "/location/filter"})
public class LocationServlet extends HttpServlet {
    private ImplDaoLocation daoLocation = new ImplDaoLocation();
    private ImpIDaoClient daoClient = new ImpIDaoClient();
    private ImpIDaoVoiture daoVoiture = new ImpIDaoVoiture();
    private ModelClient modelClient = new ModelClient();
    private ModelVoiture modelVoiture = new ModelVoiture();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();

        if (path == null || path.equals("/location")) {
            response.sendRedirect(request.getContextPath() + "/location/list");
            return;
        }

        switch (path) {
            case "/location/list":
                List<Location> locations = daoLocation.getLocations();
                request.setAttribute("locations", locations);
                request.getRequestDispatcher("/gestion_locations.jsp").forward(request, response);
                break;

            case "/location/add":
                request.setAttribute("clients", modelClient.list());
                request.setAttribute("voitures", modelVoiture.list());
                request.getRequestDispatcher("/form_add_location.jsp").forward(request, response);
                break;

            case "/location/save":
                saveLocation(request, response);
                break;

            case "/location/updating":
                int id_update = Integer.parseInt(request.getParameter("id"));
                Location location_to_update = daoLocation.getLocation(id_update);
                request.setAttribute("location", location_to_update);
                request.setAttribute("clients", modelClient.list());
                request.setAttribute("voitures", modelVoiture.list());
                request.getRequestDispatcher("/form_update_location.jsp").forward(request, response);
                break;

            case "/location/update":
                updateLocation(request, response);
                break;

            case "/location/delete":
                int id_delete = Integer.parseInt(request.getParameter("id"));
                daoLocation.supprimerLocation(id_delete);
                request.setAttribute("deleted", true);
                response.sendRedirect(request.getContextPath() + "/location/list?deleted=true");
                break;

            case "/location/filter":
                filterLocations(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void saveLocation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int clientId = Integer.parseInt(request.getParameter("client"));
            int voitureId = Integer.parseInt(request.getParameter("voiture"));
            String dateDebutStr = request.getParameter("date_debut");
            String dateFinStr = request.getParameter("date_fin");
            double prixTotal = Double.parseDouble(request.getParameter("prix_total"));
            String statut = request.getParameter("statut");

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date dateDebut = sdf.parse(dateDebutStr);
            Date dateFin = sdf.parse(dateFinStr);
            if (!daoLocation.estVoitureDisponible(voitureId, dateDebut, dateFin)) {
                request.setAttribute("error", "La voiture n'est pas disponible pour cette période");
                request.setAttribute("clients", modelClient.list());
                request.setAttribute("voitures", modelVoiture.list());
                request.getRequestDispatcher("/form_add_location.jsp").forward(request, response);
                return;
            }

            Client client = daoClient.getClient(clientId);
            Voiture voiture = daoVoiture.getVoiture(voitureId);

            Location location = new Location(client, voiture, dateDebut, dateFin);
            location.setClient(client);
            location.setVoiture(voiture);
            location.setDate_debut(dateDebut);
            location.setDate_fin(dateFin);

            daoLocation.ajouterLocation(location);
            response.sendRedirect(request.getContextPath() + "/location/list?added=true");

        } catch (ParseException e) {
            request.setAttribute("error", "Format de date invalide");
            request.setAttribute("clients", modelClient.list());
            request.setAttribute("voitures", modelVoiture.list());
            request.getRequestDispatcher("/form_add_location.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Une erreur est survenue: " + e.getMessage());
            request.setAttribute("clients", modelClient.list());
            request.setAttribute("voitures", modelVoiture.list());
            request.getRequestDispatcher("/form_add_location.jsp").forward(request, response);
        }
    }

    private void updateLocation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int locationId = Integer.parseInt(request.getParameter("id"));
            int clientId = Integer.parseInt(request.getParameter("client"));
            int voitureId = Integer.parseInt(request.getParameter("voiture"));
            String dateDebutStr = request.getParameter("date_debut");
            String dateFinStr = request.getParameter("date_fin");


            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date dateDebut = sdf.parse(dateDebutStr);
            Date dateFin = sdf.parse(dateFinStr);
            Location currentLocation = daoLocation.getLocation(locationId);
            if (currentLocation.getVoiture().getCode_voiture() != voitureId &&
                    !daoLocation.estVoitureDisponible(voitureId, dateDebut, dateFin)) {
                request.setAttribute("error", "La voiture n'est pas disponible pour cette période");
                request.setAttribute("location", currentLocation);
                request.setAttribute("clients", modelClient.list());
                request.setAttribute("voitures", modelVoiture.list());
                request.getRequestDispatcher("/form_update_location.jsp").forward(request, response);
                return;
            }

            Client client = daoClient.getClient(clientId);
            Voiture voiture = daoVoiture.getVoiture(voitureId);

            Location location = new Location(client, voiture, dateDebut, dateFin);
            location.setCode_location(locationId);
            location.setClient(client);
            location.setVoiture(voiture);
            location.setDate_debut(dateDebut);
            location.setDate_fin(dateFin);

            daoLocation.modifierLocation(location);
            response.sendRedirect(request.getContextPath() + "/location/list?updated=true");

        } catch (ParseException e) {
            request.setAttribute("error", "Format de date invalide");
            int locationId = Integer.parseInt(request.getParameter("id"));
            Location location = daoLocation.getLocation(locationId);
            request.setAttribute("location", location);
            request.setAttribute("clients", modelClient.list());
            request.setAttribute("voitures", modelVoiture.list());
            request.getRequestDispatcher("/form_update_location.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Une erreur est survenue: " + e.getMessage());
            int locationId = Integer.parseInt(request.getParameter("id"));
            Location location = daoLocation.getLocation(locationId);
            request.setAttribute("location", location);
            request.setAttribute("clients", modelClient.list());
            request.setAttribute("voitures", modelVoiture.list());
            request.getRequestDispatcher("/form_update_location.jsp").forward(request, response);
        }
    }

    private void filterLocations(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filterType = request.getParameter("filterType");
        List<Location> filteredLocations = null;

        if ("client".equals(filterType)) {
            int clientId = Integer.parseInt(request.getParameter("clientId"));
            filteredLocations = daoLocation.getLocationsByClient(clientId);
            request.setAttribute("filterType", "client");
            request.setAttribute("clientId", clientId);
        } else if ("voiture".equals(filterType)) {
            int voitureId = Integer.parseInt(request.getParameter("voitureId"));
            filteredLocations = daoLocation.getLocationsByVoiture(voitureId);
            request.setAttribute("filterType", "voiture");
            request.setAttribute("voitureId", voitureId);
        } else if ("periode".equals(filterType)) {
            try {
                String dateDebutStr = request.getParameter("dateDebut");
                String dateFinStr = request.getParameter("dateFin");
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date dateDebut = sdf.parse(dateDebutStr);
                Date dateFin = sdf.parse(dateFinStr);
                filteredLocations = daoLocation.getLocationsByPeriode(dateDebut, dateFin);
                request.setAttribute("filterType", "periode");
                request.setAttribute("dateDebut", dateDebutStr);
                request.setAttribute("dateFin", dateFinStr);
            } catch (ParseException e) {
                request.setAttribute("error", "Format de date invalide");
                filteredLocations = daoLocation.getLocations();
            }
        } else {
            filteredLocations = daoLocation.getLocations();
        }

        request.setAttribute("locations", filteredLocations);
        request.setAttribute("clients", modelClient.list());
        request.setAttribute("voitures", modelVoiture.list());
        request.getRequestDispatcher("/gestion_locations.jsp").forward(request, response);
    }
}