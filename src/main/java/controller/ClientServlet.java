package controller;

import entities.Client;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelClient;

import java.io.IOException;

@WebServlet(name = "ClientServlet", value = {"/ClientServlet", "/ClientServlet/add", "/ClientServlet/delete", "/ClientServlet/update"})
public class ClientServlet extends HttpServlet {
    private ModelClient modelClient = new ModelClient();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String num_cin = "";
        String num_permis = "";
        String email = "";
        String tel = "";
        String adresse = "";
        int age = 0;
        String nom = "";
        String prenom = "";
        if (!(request.getServletPath().equals("/ClientServlet/delete"))) {

            num_cin = request.getParameter("num_cin");
            num_permis = request.getParameter("num_permis");
            email = request.getParameter("email");
            tel = request.getParameter("tel");
            adresse = request.getParameter("adresse");
            age = Integer.parseInt(request.getParameter("age"));
            nom = request.getParameter("nom");
            prenom = request.getParameter("prenom");
        } else {
            num_cin = request.getParameter("num_cin2");


        }
        modelClient.setClient(new Client(0, num_cin, num_permis, nom, prenom, age, adresse, tel, email));
        switch (request.getServletPath()) {
            case "/ClientServlet/add":

                modelClient.add();
                break;
            case "/ClientServlet/delete":
                modelClient.delete();
                break;
            case "/ClientServlet/update":

                modelClient.update();
                break;

        }
        response.sendRedirect("gestion_clients.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}