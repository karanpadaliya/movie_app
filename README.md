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

<img src="https://github.com/karanpadaliya/movie_app/assets/72498188/03f5cdac-a3c5-433c-9125-572b15f850fa" alt="01_SplashScreen" style="width: 200px; height: 450px;"> <img src="https://github.com/karanpadaliya/movie_app/assets/72498188/77278556-b8bc-4194-838d-55c51980a53e" alt="02_HomePage" style="width: 200px; height: 450px;"> <img src="https://github.com/karanpadaliya/movie_app/assets/72498188/c11ff0e8-bbf6-4449-ab7b-583423b8a724" alt="03_00_SearchPage" style="width: 200px; height: 450px;"> <img src="https://github.com/karanpadaliya/movie_app/assets/72498188/1f00b81f-4e80-4054-be66-c585b580c6e0" alt="03_01_SearchPage" style="width: 200px; height: 450px;"> <img src="https://github.com/karanpadaliya/movie_app/assets/72498188/773f8f7a-f3bc-46d1-982a-4be97687f293" alt="03_02_SearchPage" style="width: 200px; height: 450px;"> <img src="https://github.com/karanpadaliya/movie_app/assets/72498188/6f0cc4be-b45b-4cb8-8672-f92f675a8e94" alt="03_03_SearchPage" style="width: 200px; height: 450px;"> <img src="https://github.com/karanpadaliya/movie_app/assets/72498188/86d1275e-2b26-4763-a4e8-2c770a25081c" alt="03_04_SearchPage" style="width: 200px; height: 450px;"> <img src="https://github.com/karanpadaliya/movie_app/assets/72498188/380dc360-0956-44cb-ac3a-78878651453e" alt="04_MovieDetailsPage" style="width: 200px; height: 450px;"> <img src="https://github.com/karanpadaliya/movie_app/assets/72498188/b4f5f102-e987-4822-8ba2-ce7e00866212" alt="05_MovieAddBox" style="width: 200px; height: 450px;"> <img src="https://github.com/karanpadaliya/movie_app/assets/72498188/384d81ab-6821-4076-af39-64b89e324f78" alt="06_MovieDetailsPage" style="width: 200px; height: 450px;"> <img src="https://github.com/karanpadaliya/movie_app/assets/72498188/cb0c256e-3866-4aab-adb3-234ca1706c8c" alt="07_MovieAddBox" style="width: 200px; height: 450px;"> <img src="https://github.com/karanpadaliya/movie_app/assets/72498188/b8dec56a-996a-4a4e-89cc-9ffdfa39e606" alt="08_MovieAddBox" style="width: 200px; height: 450px;"> <img src="https://github.com/karanpadaliya/movie_app/assets/72498188/d0b6eb3a-e145-4971-a07b-bdcc5b91d16c" alt="09_MovieAlreadyAddBox" style="width: 200px; height: 450px;"> <img src="https://github.com/karanpadaliya/movie_app/assets/72498188/0187f8da-d498-4d42-ac66-f520f667c222" alt="10_ShareMovie" style="width: 200px; height: 450px;"> <img src="https://github.com/karanpadaliya/movie_app/assets/72498188/2aa98550-27f4-4323-889d-ced5467308cc" alt="11_FavoritePage" style="width: 200px; height: 450px;"> <img src="https://github.com/karanpadaliya/movie_app/assets/72498188/5d8ff2f0-8a1f-4bbc-bd6b-3cef0b5317c9" alt="12_HomePage" style="width: 200px; height: 450px;">



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
      │   ├── components/
      │   │   ├── HomePage(Favorite).dart
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
    <li>path_provider for accessing temporary directory</li>
  </ul>

  <h2>Dependencies</h2>

  <pre>
    <code>
      dependencies:
        cupertino_icons: ^1.0.2
        provider: ^6.1.2
        http: ^1.2.0
        url_launcher: ^6.3.0
        shared_preferences: ^2.2.3
        carousel_slider: ^4.2.1
        share_plus: ^7.2.2
        path_provider: ^2.1.3
    </code>
  </pre>

  <h2>License</h2>

  <p>This project is licensed under the MIT License. See the <a href="LICENSE">LICENSE</a> file for details.</p>
</body>
</html>
