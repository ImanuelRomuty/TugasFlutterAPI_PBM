import 'dart:convert';

import '../model/itemResponse.dart';
import 'package:http/http.dart' as http;

// final BASE_URL = "https://api.themoviedb.org/3/";

// Future<Movie> getMovie() async {
//   final END_POINT =
//       "movie/20/recommendations?api_key=d17a31c6ea9abaa31583c493f08702db&language=en-US&page=1";
//   final url = Uri.parse(BASE_URL + END_POINT);

//   //await nunggu http.get(url); lalu jalankan kode dibawahnya
//   http.Response response = await http.get(url);

//   final JSON = jsonDecode(response.body);
//   final result = Movie.fromJson(JSON);
//   return result;
// }
