# ShelfSense: Book Recommendation using Gemini API in Java

A smart book recommendation system that leverages Google's Gemini API to provide personalized book suggestions based on user preferences. Built with Java servlets, Hibernate ORM, and modern web technologies.

## 🚀 Features

- **Personalized Recommendations**: Get tailored book suggestions based on your favorite genres, authors, reading purposes, and preferences
- **User Authentication**: Secure login and registration system
- **Recommendation History**: Track and view your past recommendation requests
- **AI-Powered Suggestions**: Utilizes Google's Gemini API for intelligent book recommendations
- **Responsive Design**: User-friendly interface for seamless experience

## 🛠️ Technology Stack

- **Backend**: Java Servlets, JSP
- **ORM**: Hibernate
- **Database**: MySQL/PostgreSQL (configurable)
- **AI Integration**: Google Gemini API
- **HTTP Client**: OkHttp3
- **JSON Processing**: Gson
- **Server**: Apache Tomcat

## 📋 Prerequisites

- Java 11 or higher
- Apache Tomcat 9+
- MySQL or PostgreSQL database
- Google Gemini API key
- Maven (for dependency management)

## 🔧 Installation & Setup

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/shelfsense.git
cd shelfsense
```

### 2. Database Setup
Create a database and configure the connection in `hibernate.cfg.xml`:

```xml
<hibernate-configuration>
    <session-factory>
        <property name="hibernate.connection.driver_class">com.mysql.cj.jdbc.Driver</property>
        <property name="hibernate.connection.url">jdbc:mysql://localhost:3306/shelfsense</property>
        <property name="hibernate.connection.username">your_username</property>
        <property name="hibernate.connection.password">your_password</property>
        <property name="hibernate.hbm2ddl.auto">create</property>
        <property name="hibernate.show_sql">true</property>
    </session-factory>
</hibernate-configuration>
```

### 3. Configure Gemini API
Update the API configuration in `BookRecServlet.java`:

```java
private static final String API_KEY = "your_gemini_api_key_here";
private static final String API_URL = "https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateContent?key=";
```

### 4. Database Schema
The application will automatically create the following tables:
- `users` - User account information
- `user_inputs` - User preference history

### 5. Deploy to Tomcat
1. Build the project using Maven
2. Deploy the WAR file to your Tomcat server
3. Access the application at `http://localhost:8080/shelfsense`

## 📁 Project Structure

```
src/main/java/com/ajava/shelfsense/
├── BookRecServlet.java      # Handles book recommendation requests
├── HibernateUtil.java       # Database connection utility
├── HistoryServlet.java      # User history management
├── LoginServlet.java        # User authentication
├── RegisterServlet.java     # User registration
├── User.java               # User entity model
└── UserInput.java          # User input entity model
```

## 🎯 How It Works

1. **User Registration/Login**: Users create accounts or log in to existing ones
2. **Preference Input**: Users specify their reading preferences including:
   - Favorite genres
   - Preferred authors
   - Reading purpose (entertainment, education, etc.)
   - Preferred era (classic, contemporary, etc.)
   - Reading length preference
3. **AI Processing**: The system sends user preferences to Google's Gemini API
4. **Recommendation Generation**: Gemini analyzes preferences and returns 5 personalized book recommendations
5. **History Tracking**: All user inputs are saved for future reference

## 🔒 Security Features

- Session management for user authentication
- Input validation and sanitization
- Secure database connections
- Protected routes requiring authentication

## 🚧 Future Enhancements

- [ ] Password hashing and encryption
- [ ] Book rating and review system
- [ ] Social features (share recommendations)
- [ ] Advanced filtering options
- [ ] Integration with book APIs for cover images and detailed information
- [ ] Machine learning-based preference learning
- [ ] Mobile app development

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Google Gemini API for AI-powered recommendations
- Hibernate team for excellent ORM framework
- OkHttp team for reliable HTTP client
- Gson team for JSON processing

## 📞 Contact

For questions or support, please open an issue on GitHub or contact [adityazala404@gmail.com](adityazala404@gmail.com).

---

**Note**: Remember to keep your API keys secure and never commit them to version control. Use environment variables or configuration files that are excluded from your repository.
