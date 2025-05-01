package com.ajava.shelfsense;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.hibernate.Session;
import java.io.IOException;
import java.util.List;

@WebServlet("/history")
public class HistoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession httpSession = request.getSession(false);
        if (httpSession == null || httpSession.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) httpSession.getAttribute("userId");
        Session hibernateSession = HibernateUtil.getSessionFactory().openSession();
        
        try {
            List<UserInput> inputs = hibernateSession.createQuery(
                "FROM UserInput WHERE userId = :userId ORDER BY submittedAt DESC", UserInput.class)
                .setParameter("userId", userId)
                .getResultList();
            
            request.setAttribute("inputs", inputs);
            request.getRequestDispatcher("/history.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error retrieving history.");
            request.getRequestDispatcher("/history.jsp").forward(request, response);
        } finally {
            hibernateSession.close();
        }
    }
}