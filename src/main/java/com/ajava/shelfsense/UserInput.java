package com.ajava.shelfsense;

import jakarta.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "user_inputs")
public class UserInput {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column(name = "user_id")
    private int userId;
    
    private String genre;
    
    @Column(name = "favorite_author")
    private String favoriteAuthor;
    
    private String purpose;
    
    @Column(name = "preferred_era")
    private String preferredEra;
    
    @Column(name = "reading_length")
    private String readingLength;
    
    @Column(name = "submitted_at")
    private Timestamp submittedAt;

    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    public String getGenre() { return genre; }
    public void setGenre(String genre) { this.genre = genre; }
    public String getFavoriteAuthor() { return favoriteAuthor; }
    public void setFavoriteAuthor(String favoriteAuthor) { this.favoriteAuthor = favoriteAuthor; }
    public String getPurpose() { return purpose; }
    public void setPurpose(String purpose) { this.purpose = purpose; }
    public String getPreferredEra() { return preferredEra; }
    public void setPreferredEra(String preferredEra) { this.preferredEra = preferredEra; }
    public String getReadingLength() { return readingLength; }
    public void setReadingLength(String readingLength) { this.readingLength = readingLength; }
    public Timestamp getSubmittedAt() { return submittedAt; }
    public void setSubmittedAt(Timestamp submittedAt) { this.submittedAt = submittedAt; }
}