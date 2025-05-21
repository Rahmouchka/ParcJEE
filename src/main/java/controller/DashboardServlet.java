package controller;

import entities.Client;
import entities.Location;
import entities.Parc;
import entities.Voiture;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelClient;
import model.ModelLocation;
import model.ModelParc;
import model.ModelVoiture;

import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    private ModelClient modeleClient = new ModelClient();
    private ModelLocation modeleloc = new ModelLocation();
    private ModelParc modeleparc = new ModelParc();
    private ModelVoiture modeleVoiture = new ModelVoiture();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Client> clients = modeleClient.getClients();
        request.setAttribute("clients", clients.size());
        List<Location> locations = modeleloc.getLocations();
        request.setAttribute("locations", locations.size());
        List<Location> locationsEnCours = modeleloc.getLocationsCourrante();
        request.setAttribute("locationsEnCours", locationsEnCours);
        List<Parc> parcs = modeleparc.getParcs();
        request.setAttribute("parcs", parcs.size());
        List<Voiture> voitures = modeleVoiture.getVoitures();
        request.setAttribute("voitures", voitures.size());
        List<Voiture> voituresDispo = modeleVoiture.voitureDispo();
        request.setAttribute("voituresDispo", voituresDispo);
        request.getRequestDispatcher("/dashboard.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}