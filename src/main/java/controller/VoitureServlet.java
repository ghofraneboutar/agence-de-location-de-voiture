package controller;

import entities.Parc;
import entities.Voiture;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelParc;
import model.ModelVoiture;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "voiture", value = {"/voiture", "/voiture/add", "/voiture/save", "/voiture/delete", "/voiture/update", "/voiture/updating", "/voiture/list", "/voiture/recherche"})
public class VoitureServlet extends HttpServlet {
    private ModelVoiture modelVoiture = new ModelVoiture();
    private ModelParc modelParc = new ModelParc();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();


        if (path == null || path.equals("/voiture")) {
            response.sendRedirect(request.getContextPath() + "/voiture/list");
            return;
        }
        if (path.equals("/voiture/recherche")) {
            rechercherVoitures(request, response);
            return;
        }
        switch (path) {
            case "/voiture/add":
                List<Parc> parcs = modelParc.list();

                request.setAttribute("parcs", parcs);
                request.getRequestDispatcher("/form_add_voiture.jsp").forward(request, response);
                break;
            case "/voiture/save":
                System.out.println(request.getParameter("kilometrage"));
                Voiture voiture_add = new Voiture();
                voiture_add.setMatricule(request.getParameter("matricule"));
                voiture_add.setModele(request.getParameter("modele"));
                voiture_add.setKilometrage(Float.parseFloat(request.getParameter("kilometrage")));
                voiture_add.setMarque(request.getParameter("marque"));
                Parc parc_add = modelParc.getParc(Integer.parseInt(request.getParameter("parc")));

                voiture_add.setParc(parc_add);

                modelVoiture.setVoiture(voiture_add);
                modelVoiture.add();
                request.setAttribute("added", true);
                request.getRequestDispatcher("/voiture/list").forward(request, response);
                break;


            case "/voiture/list":
                List<Voiture> voitures = modelVoiture.list();

                request.setAttribute("voitures", voitures);
                request.getRequestDispatcher("/gestion_voitures.jsp").forward(request, response);
                break;

            case "/voiture/updating":
                int id_update = Integer.parseInt(request.getParameter("id"));
                Voiture voiture_to_update = modelVoiture.getVoiture(id_update);
                List<Parc> parcs_update = modelParc.list();

                request.setAttribute("parcs", parcs_update);
                request.setAttribute("voiture_to_update", voiture_to_update);
                request.getRequestDispatcher("/form_update_voiture.jsp").forward(request, response);
                break;
            case "/voiture/update":
                int id_updated = Integer.parseInt(request.getParameter("id"));


                Voiture voiture_updated = new Voiture();
                voiture_updated.setCode_voiture(id_updated);
                voiture_updated.setMatricule(request.getParameter("matricule"));
                voiture_updated.setModele(request.getParameter("modele"));
                voiture_updated.setKilometrage(Float.parseFloat(request.getParameter("kilometrage")));
                voiture_updated.setMarque(request.getParameter("marque"));
                Parc parc_updated = modelParc.getParc(Integer.parseInt(request.getParameter("parc")));

                voiture_updated.setParc(parc_updated);


                modelVoiture.setVoiture(voiture_updated);
                modelVoiture.update();
                request.setAttribute("updated", true);
                request.getRequestDispatcher("/voiture/list").forward(request, response);
                break;

            case "/voiture/delete":
                int id_delete = Integer.parseInt(request.getParameter("id"));
                Voiture voiture_delete = new Voiture();
                voiture_delete.setCode_voiture(id_delete);
                modelVoiture.setVoiture(voiture_delete);
                modelVoiture.delete();
                request.setAttribute("deleted", true);
                request.getRequestDispatcher("/voiture/list").forward(request, response);
                break;


        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    private void rechercherVoitures(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String lieu = request.getParameter("lieu");
        String categorie = request.getParameter("categorie");
        String dateDebutStr = request.getParameter("date_debut");
        String dateFinStr = request.getParameter("date_fin");
        String marque = request.getParameter("marque");
        String modele = request.getParameter("modele");

        Date dateDebut = null;
        Date dateFin = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        try {
            if (dateDebutStr != null && !dateDebutStr.isEmpty()) {
                dateDebut = sdf.parse(dateDebutStr);
            }
            if (dateFinStr != null && !dateFinStr.isEmpty()) {
                dateFin = sdf.parse(dateFinStr);
            }
        } catch (ParseException e) {
            request.setAttribute("error", "Format de date invalide");
            request.getRequestDispatcher("/accueil.jsp").forward(request, response);
            return;
        }

        if (dateDebut != null && dateFin != null && dateFin.before(dateDebut)) {
            request.setAttribute("error", "La date de fin doit être après la date de début");
            request.getRequestDispatcher("/accueil.jsp").forward(request, response);
            return;
        }

        List<Voiture> voitures = modelVoiture.list();
        List<Voiture> voituresFiltrees = new ArrayList<>(voitures);

        if (lieu != null && !lieu.isEmpty()) {
            voituresFiltrees = voituresFiltrees.stream()
                    .filter(v -> v.getParc() != null &&
                            v.getParc().getLocalisation() != null &&
                            v.getParc().getLocalisation().toLowerCase().contains(lieu.toLowerCase()))
                    .collect(Collectors.toList());
        }

        if (marque != null && !marque.isEmpty()) {
            voituresFiltrees = voituresFiltrees.stream()
                    .filter(v -> v.getMarque() != null &&
                            v.getMarque().toLowerCase().contains(marque.toLowerCase()))
                    .collect(Collectors.toList());
        }

        if (modele != null && !modele.isEmpty()) {
            voituresFiltrees = voituresFiltrees.stream()
                    .filter(v -> v.getModele() != null &&
                            v.getModele().toLowerCase().contains(modele.toLowerCase()))
                    .collect(Collectors.toList());
        }

        if (dateDebut != null && dateFin != null) {
            Date finalDateDebut = dateDebut;
            Date finalDateFin = dateFin;
            voituresFiltrees = voituresFiltrees.stream()
                    .filter(v -> estDisponible(v.getCode_voiture(), finalDateDebut, finalDateFin))
                    .collect(Collectors.toList());
        }

        request.setAttribute("voitures", voituresFiltrees);
        request.setAttribute("lieu", lieu);
        request.setAttribute("categorie", categorie);
        request.setAttribute("marque", marque);
        request.setAttribute("modele", modele);
        request.setAttribute("date_debut", dateDebutStr);
        request.setAttribute("date_fin", dateFinStr);

        request.getRequestDispatcher("/resultats-recherche.jsp").forward(request, response);
    }
    private boolean estDisponible(int voitureId, Date dateDebut, Date dateFin) {
        // Exemple fictif : À remplacer par une vraie vérification dans la table des réservations
        return Math.random() > 0.3;
    }


}