package com.ajava.shelfsense;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.RequestDispatcher;
import java.sql.Timestamp;
import java.time.Instant;

import org.hibernate.Session;
import org.hibernate.Transaction;

import okhttp3.*;
import com.google.gson.*;

import java.io.IOException;

//@WebServlet("/recommend")
public class BookRecServlet extends HttpServlet {

    private static final String API_KEY = "YOUR_GEMINI_API_KEY";
    private static final String API_URL = "YOUR_GEMINI_API_URL" + API_KEY;

    private static final OkHttpClient client = new OkHttpClient();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        // 1. Get form data
        int userId = (int) session.getAttribute("userId");
        String genre = request.getParameter("genre");
        String author = request.getParameter("author");
        String purpose = request.getParameter("purpose");
        String era = request.getParameter("era");
        String length = request.getParameter("length");

        // Store the input using Hibernate
        Session hibernateSession = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        
        try {
            transaction = hibernateSession.beginTransaction();
            
            UserInput input = new UserInput();
            input.setUserId(userId);
            input.setGenre(genre);
            input.setFavoriteAuthor(author);
            input.setPurpose(purpose);
            input.setPreferredEra(era);
            input.setReadingLength(length);
            input.setSubmittedAt(Timestamp.from(Instant.now()));
            
            hibernateSession.persist(input);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            // Continue even if storage fails
        } finally {
            hibernateSession.close();
        }

        // 2. Build prompt
        String prompt = "Act as a book recommendation assistant. " +
                        "The user prefers books in the genres: " + genre + ". Their favorite authors include: " + author + 
                        ". They want books that are " + era +
                        ", primarily for " + purpose + ". " +
                        "They prefer " + length + " books." +
                        "Suggest 5 books with 1-2 line descriptions.";

        // 3. Get recommendation
        String recommendations = getLLMResponse(prompt);

        // 4. Forward to JSP with result
        request.setAttribute("recommendations", recommendations);
        RequestDispatcher rd = request.getRequestDispatcher("/result.jsp");
        rd.forward(request, response);
    }

    private String getLLMResponse(String userPrompt) throws IOException {
        JsonObject message = new JsonObject();
        JsonArray parts = new JsonArray();
        JsonObject part = new JsonObject();
        part.addProperty("text", userPrompt);
        parts.add(part);

        JsonObject content = new JsonObject();
        content.add("parts", parts);
        message.add("contents", new JsonArray());
        message.getAsJsonArray("contents").add(content);

        RequestBody body = RequestBody.create(
                message.toString(),
                MediaType.parse("application/json")
        );

        Request request = new Request.Builder()
                .url(API_URL)
                .post(body)
                .build();

        try (Response response = client.newCall(request).execute()) {
            if (!response.isSuccessful()) throw new IOException("Unexpected code " + response);

            String jsonResponse = response.body().string();
            JsonObject jsonObject = JsonParser.parseString(jsonResponse).getAsJsonObject();
            JsonArray candidates = jsonObject.getAsJsonArray("candidates");

            if (candidates != null && candidates.size() > 0) {
                JsonObject first = candidates.get(0).getAsJsonObject();
                JsonArray contentParts = first.getAsJsonObject("content").getAsJsonArray("parts");
                return contentParts.get(0).getAsJsonObject().get("text").getAsString();
            } else {
                return "No recommendations found.";
            }
        }
    }
}
