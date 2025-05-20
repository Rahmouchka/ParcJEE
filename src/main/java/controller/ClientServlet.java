package controller;

import entities.Client;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelClient;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "client", value = {"/client", "/client/list", "/client/update", "/client/save", "/client/add", "/client/delete", "/client/updating"})
public class ClientServlet extends HttpServlet {
    private ModelClient modelClient = new ModelClient();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();

        if (path == null || path.equals("/client")) {
            response.sendRedirect(request.getContextPath() + "/client/list");
            return;
        }

        switch (path) {
            case "/client/add":
                request.getRequestDispatcher("/form_add_client.jsp").forward(request, response);
                break;

            case "/client/save":
                Client client_add = new Client();
                client_add.setNcin(Integer.parseInt(request.getParameter("num_cin")));
                client_add.setNom(request.getParameter("nom"));
                client_add.setPrenom(request.getParameter("prenom"));
                client_add.setAge(Integer.parseInt(request.getParameter("age")));
                client_add.setAdresse(request.getParameter("adresse"));
                client_add.setNum_permis(Integer.parseInt(request.getParameter("num_permis")));
                client_add.setEmail(request.getParameter("email"));
                client_add.setTel(Integer.parseInt(request.getParameter("tel")));
                modelClient.setClient(client_add);
                modelClient.add();
                request.setAttribute("added", true);
                request.getRequestDispatcher("/client/list").forward(request, response);
                break;

            case "/client/list":
                List<Client> clients = modelClient.list();

                request.setAttribute("clients", clients);
                request.getRequestDispatcher("/GestionClient.jsp").forward(request, response);
                break;

            case "/client/updating":
                int id_update = Integer.parseInt(request.getParameter("id"));
                Client client_to_update = modelClient.getClient(id_update);
                request.setAttribute("client_to_update", client_to_update);
                request.getRequestDispatcher("/form_update_client.jsp").forward(request, response);
                break;
            case "/client/update":
                int id_updated = Integer.parseInt(request.getParameter("id"));
                Client client_updated = new Client();
                client_updated.setCode_client(id_updated);
                client_updated.setNcin(Integer.parseInt(request.getParameter("num_cin")));
                client_updated.setNom(request.getParameter("nom"));
                client_updated.setPrenom(request.getParameter("prenom"));
                client_updated.setAge(Integer.parseInt(request.getParameter("age")));
                client_updated.setAdresse(request.getParameter("adresse"));
                client_updated.setNum_permis(Integer.parseInt(request.getParameter("num_permis")));
                client_updated.setEmail(request.getParameter("email"));
                client_updated.setTel(Integer.parseInt(request.getParameter("tel")));

                modelClient.setClient(client_updated);
                modelClient.update();
                request.setAttribute("updated", true);
                request.getRequestDispatcher("/client/list").forward(request, response);
                break;

            case "/client/delete":
                int id_delete = Integer.parseInt(request.getParameter("id"));
                Client client_delete = new Client();
                client_delete.setCode_client(id_delete);
                modelClient.setClient(client_delete);
                modelClient.delete();
                request.setAttribute("deleted", true);
                request.getRequestDispatcher("/client/list").forward(request, response);
                break;


        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}


/*
@WebServlet(name = "ClientServlet", value = "/ClientServlet")
public class ClientServlet extends HttpServlet {
    private ModelClient modelClient = new ModelClient();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("GestionClient.jsp");
        /*int num_cin = 0;
        int num_permis = 0;
        String email = "";
        int tel = 0;
        String adresse = "";
        int age = 0;
        String nom = "";
        String prenom = "";
        if (!(request.getServletPath().equals("/ClientServlet/delete"))) {

            num_cin = Integer.parseInt(request.getParameter("num_cin"));
            num_permis = Integer.parseInt(request.getParameter("num_permis"));
            email = request.getParameter("email");
            tel = Integer.parseInt(request.getParameter("tel"));
            adresse = request.getParameter("adresse");
            age = Integer.parseInt(request.getParameter("age"));
            nom = request.getParameter("nom");
            prenom = request.getParameter("prenom");
        } else {
            num_cin =Integer.parseInt(request.getParameter("num_cin2"));
        }
        modelClient.setClient(new Client(0, num_cin, nom, prenom, adresse, age, num_permis,email, tel));
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
        response.sendRedirect("GestionClient.jsp");    }

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
}
 */