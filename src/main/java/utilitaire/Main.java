package utilitaire;

import dao.ImpIDaoClient;
import entities.Client;

public class Main {
    public static void main(String[] args) {
        ImpIDaoClient dao = new ImpIDaoClient();
        Client c = dao.rechercheByNom("Dupont");
        System.out.println(c);
        Client c1 = dao.rechercheByNumCIN("CC112233");
        System.out.println(c1);
    }
}
