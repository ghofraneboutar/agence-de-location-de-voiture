package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/LoginServlet")
public class AuthServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final Map<String, User> users = new HashMap<>();

    @Override
    public void init() throws ServletException {
        // Création de comptes fictifs
        users.put("admin", new User("admin", "admin123", "admin"));
        users.put("client", new User("client", "client123", "client"));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Récupération des paramètres du formulaire
        String login = request.getParameter("login");
        String password = request.getParameter("password");

        User user = users.get(login);

        if (user != null && user.getPassword().equals(password)) {
            // Redirection selon le rôle
            if ("admin".equals(user.getRole())) {
                response.sendRedirect("index.jsp");
            } else if ("client".equals(user.getRole())) {
                response.sendRedirect("accueil.jsp");
            } else {
                response.sendRedirect("erreur.jsp");
            }
        } else {
            response.setContentType("text/html");
            response.getWriter().println("<h3>Échec de connexion. Identifiants incorrects.</h3>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }
}
