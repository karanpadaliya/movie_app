<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
  <h1>Movie App</h1>

  <h2>Introduction</h2>

  <p>The Movie App is a Flutter application that enables users to search for movies, view detailed information, and save their favorite movies locally. It utilizes the OMDB API to fetch movie data and implements local storage using shared preferences. Users can search for movies, view movie details, mark movies as favorites, and view their favorite movies.</p>

  <h2>Features</h2>

  <ul>
    <li><strong>Splash Screen:</strong> Displays an introductory splash screen when the app is launched.</li>
    <li><strong>Home Page:</strong> Allows users to search for movies and displays search results in a grid format.</li>
    <li><strong>Detail Page:</strong> Shows detailed information about a selected movie.</li>
    <li><strong>Liked Movies Page:</strong> Displays movies that have been marked as favorites. Users can also remove movies from their favorites.</li>
    <li><strong>API Integration:</strong> Fetches movie data from the OMDB API.</li>
    <li><strong>Local Storage:</strong> Saves favorite movies using shared preferences.</li>
    <li><strong>Share Movie Details:</strong> Users can share movie details via various platforms using the share_plus plugin.</li>
    <li><strong>Carousel Slider:</strong> Displays movie posters in a carousel slider on the Detail Page for a visually appealing UI.</li>
  </ul>

  <h2>Screenshots</h2>

  <h3>Splash Screen</h3>
  <img src="screenshots/splash_screen.png" alt="Splash Screen">

  <h3>Home Page</h3>
  <img src="screenshots/home_page.png" alt="Home Page">

  <h3>Detail Page</h3>
  <img src="screenshots/detail_page.png" alt="Detail Page">

  <h3>Liked Movies Page</h3>
  <img src="screenshots/liked_movies_page.png" alt="Liked Movies Page">

  <h2>GIF Demo</h2>

  <img src="screenshots/app_demo.gif" alt="App Demo">

  <h2>Installation</h2>

  <ol>
    <li><strong>Clone the repository:</strong><br>
      <code>git clone https://github.com/yourusername/movie-app.git</code></li>
    <li><strong>Navigate to the project directory:</strong><br>
      <code>cd movie-app</code></li>
    <li><strong>Install dependencies:</strong><br>
      <code>flutter pub get</code></li>
    <li><strong>Run the app:</strong><br>
      <code>flutter run</code></li>
  </ol>

  <h2>Usage</h2>

  <ol>
    <li><strong>Search for Movies:</strong> Enter a movie name in the search bar on the Home Page to fetch movie data from the OMDB API.</li>
    <li><strong>View Movie Details:</strong> Tap on a movie from the search results to view detailed information on the Detail Page.</li>
    <li><strong>Save Favorite Movies:</strong> Tap the favorite icon on the Detail Page to save a movie to the Liked Movies Page.</li>
    <li><strong>View Liked Movies:</strong> Navigate to the Liked Movies Page to see all saved favorite movies. You can also remove movies from this page.</li>
    <li><strong>Share Movie Details:</strong> Tap the share icon on the Detail Page to share movie details via various platforms.</li>
  </ol>

  <h2>Project Structure</h2>

  <pre>
    <code>
      lib/
      ├── controller/
      │   ├── api_helper.dart
      │   ├── favorites_provider.dart
      │   ├── home_provider.dart
      ├── model/
      │   ├── movie_details_model.dart
      │   ├── search_model.dart
      ├── view/
      │   ├── splash_screen.dart
      │   ├── home_page.dart
      │   ├── detail_page.dart
      │   ├── liked_movies_page.dart
      ├── main.dart
    </code>
  </pre>

  <h2>Assumptions</h2>

  <ul>
    <li>The app assumes a stable internet connection for fetching data from the OMDB API.</li>
    <li>Shared preferences are used for storing favorite movies locally.</li>
    <li>The app utilizes third-party plugins such as share_plus, carousel_slider, http, and url_launcher for additional functionalities.</li>
  </ul>

  <h2>Technologies Used</h2>

  <ul>
    <li>Flutter</li>
    <li>Provider for state management</li>
    <li>http for API integration</li>
    <li>shared_preferences for local storage</li>
    <li>carousel_slider for carousel slider UI</li>
    <li>url_launcher for launching URLs</li>
    <li>share_plus for sharing movie details</li>
  </ul>

  <h2>License</h2>

  <p>This project is licensed under the MIT License. See the <a href="LICENSE">LICENSE</a> file for details.</p>
</body>
</html>
