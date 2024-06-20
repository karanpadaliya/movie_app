import 'package:http/http.dart';

class ApiHelper {
  String baseUrl = "http://www.omdbapi.com/?apikey=d18e87e9&";

  ApiHelper._MovieName();

  static final ApiHelper obj = ApiHelper._MovieName();

  Future<Response> getApiMovieData(String movieName) async {
    try {
      Response res = await get(Uri.parse("$baseUrl&s=$movieName"));
      if (res.statusCode == 200) {
        return res;
      } else {
        throw Exception('Failed to load movie data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
