import 'package:http/http.dart';
import 'package:movie_app/model/movieDetailsModel.dart';

class ApiHelper {
  String baseUrl = "http://www.omdbapi.com/?apikey=d18e87e9&";

  ApiHelper._MovieName();

  static final ApiHelper obj = ApiHelper._MovieName();

  Future<Response> getApiMovieData(String movieName, [String? type, String? year]) async {
    try {
      String url = "$baseUrl&s=$movieName";
      if (type != null && type.isNotEmpty) {
        url += "&type=$type";
      }
      if (year != null && year.isNotEmpty) {
        url += "&y=$year";
      }

      Response res = await get(Uri.parse(url));
      if (res.statusCode == 200) {
        return res;
      } else {
        throw Exception('Failed to load movie data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<MovieDetailsModel> getApiMovieDetails(String imdbID) async {
    try {
      Response response = await get(Uri.parse("$baseUrl&i=$imdbID"));
      if (response.statusCode == 200) {
        return movieDetailsModelFromJson(response.body);
      } else {
        throw Exception('Failed to load movie data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
