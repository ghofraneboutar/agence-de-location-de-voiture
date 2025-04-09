package model;

import dao.IDaoClient;
import dao.ImpIDaoClient;
import entities.Client;

public class ModelClient {
    private Client client;
    private IDaoClient daoClient;

    public ModelClient() {
        this.daoClient = new ImpIDaoClient();

    }

    public void add() {
        this.daoClient.ajouterClient(client);
    }

    public void delete() {
        this.daoClient.supprimerClient(client.getNum_cin());
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
