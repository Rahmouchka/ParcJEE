package controller;

import dao.ImpDaoClient;
import dao.ImpDaoVoiture;
import entities.Client;
import entities.Location;
import entities.Voiture;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelLocation;

import java.io.IOException;
import java.sql.Date;
import java.util.List;


@WebServlet(name = "location", value = {"/location", "/location/add", "/location/save", "/location/delete", "/location/update", "/location/updating", "/location/list"})
public class LocationServlet extends HttpServlet {
    private ModelLocation modeleloc = new ModelLocation();
    private ImpDaoClient daoClient = new ImpDaoClient();
    private ImpDaoVoiture daoVoiture = new ImpDaoVoiture();


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();

        if (path == null || path.equals("/location")) {
            response.sendRedirect(request.getContextPath() + "/location/list");
            return;
        }

        switch (path) {
            case "/location/list":
                List<Location> locations = modeleloc.getLocations();
                request.setAttribute("locations", locations);
                request.getRequestDispatcher("/GestionLocation.jsp").forward(request, response);
                break;

            case "/location/add":
                List<Client> clients = daoClient.getClients();
                List<Voiture> voitures = daoVoiture.getVoitures();
                request.setAttribute("clients", clients);
                request.setAttribute("voitures", voitures);
                request.getRequestDispatcher("/form_add_location.jsp").forward(request, response);
                break;

            case "/location/save":
                int client = Integer.parseInt(request.getParameter("codeclient"));
                String voiture = request.getParameter("matricule");
                String dateDebStr = request.getParameter("dateDeb");
                String dateFinStr = request.getParameter("dateFin");

                Date debut = Date.valueOf(dateDebStr);
                Date fin = Date.valueOf(dateFinStr);

                Location loc = new Location();
                loc.setClient(daoClient.getClient(client));
                loc.setVoiture(daoVoiture.getVoitureByMatricule(voiture));
                loc.setDate_deb(debut);
                loc.setDate_fin(fin);

                modeleloc.setLocation(loc);
                modeleloc.ajouterLocation();

                request.setAttribute("added", true);
                request.getRequestDispatcher("/location/list").forward(request, response);
                break;

            case "/location/updating":
                int idUpdate = Integer.parseInt(request.getParameter("codeLoc"));
                Location locationToUpdate = modeleloc.getLocationByCode(idUpdate);
                List<Client> clientsUpdate = daoClient.getClients();
                List<Voiture> voituresUpdate = daoVoiture.getVoitures();

                request.setAttribute("location_to_update", locationToUpdate);
                request.setAttribute("clients", clientsUpdate);
                request.setAttribute("voitures", voituresUpdate);
                request.getRequestDispatcher("/form_update_location.jsp").forward(request, response);
                break;

            case "/location/update":
                int codeLoc = Integer.parseInt(request.getParameter("codeLoc"));
                int clientId = Integer.parseInt(request.getParameter("codeclient"));
                String voitureId = request.getParameter("matricule");
                String dateDebUpdate = request.getParameter("dateDeb");
                String dateFinUpdate = request.getParameter("dateFin");

                Date debutUpdate = Date.valueOf(dateDebUpdate);
                Date finUpdate = Date.valueOf(dateFinUpdate);

                Location locUpdate = new Location();
                locUpdate.setCodeLocation(codeLoc);
                locUpdate.setClient(daoClient.getClient(clientId));
                locUpdate.setVoiture(daoVoiture.getVoitureByMatricule(voitureId));
                locUpdate.setDate_deb(debutUpdate);
                locUpdate.setDate_fin(finUpdate);

                modeleloc.setLocation(locUpdate);
                modeleloc.modifierLocation();

                request.setAttribute("updated", true);
                request.getRequestDispatcher("/location/list").forward(request, response);
                break;

            case "/location/delete":
                int idDelete = Integer.parseInt(request.getParameter("codeLoc"));
                Location locDelete = modeleloc.getLocationByCode(idDelete);
                modeleloc.setLocation(locDelete);
                modeleloc.supprimerLocation();

                request.setAttribute("deleted", true);
                request.getRequestDispatcher("/location/list").forward(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}