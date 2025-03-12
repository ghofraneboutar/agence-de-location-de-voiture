package dao;

import entities.Client;

public class Main {
    public static void main(String[] args) {
        ImpIDaoClient dao = new ImpIDaoClient();
        Client client = new Client(0, "12345678", "1234567890", "med", "mk", 21, "chebba", "50840313", "mmk@gmail.com");
        dao.ajouterClient(client);
    }
}
