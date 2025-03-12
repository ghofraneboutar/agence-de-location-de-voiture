package dao;

import entities.Client;

import java.util.ArrayList;

public interface IDaoClient {
    void ajouterClient(Client client);

    void supprimerClient(int id);

    void modifierClient(Client client);

    Client getClient(int id);

    ArrayList<Client> getClients();

}
