package model;

import dao.IDaoClient;
import dao.ImpIDaoClient;
import entities.Client;

import java.util.ArrayList;

public class ModelClient {
    private Client client;
    private IDaoClient daoClient;

    public ModelClient() {
        this.daoClient = new ImpIDaoClient();

    }
    public ArrayList<Client> getClients() {
        return daoClient.getClients();
    }

    public void add() {
        this.daoClient.ajouterClient(client);
    }

    public void delete() {
        this.daoClient.supprimerClient(client.getCode_client());
    }

    public void update() {
        this.daoClient.modifierClient(client);
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public IDaoClient getDaoClient() {
        return daoClient;
    }

    public void setDaoClient(IDaoClient daoClient) {
        this.daoClient = daoClient;
    }
}
