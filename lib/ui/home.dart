import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/itemResponse.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final List<MovieResult> data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Recommendations'),
      ),
      body: FutureBuilder<MovieData>(
        future: getMovie(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<MovieResult> movieResults = snapshot.data!.results;
            // Tampilkan data dalam ListView
            return ListView.builder(
              itemCount: movieResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(movieResults[index].title),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<MovieData> getMovie() async {
    final url = Uri.parse(
        "https://api.themoviedb.org/3/movie/20/recommendations?api_key=d17a31c6ea9abaa31583c493f08702db&language=en-US&page=1%22");
    http.Response response = await http.get(url);
    final json = jsonDecode(response.body);

    final List<MovieResult> data = [];
    if (json['results'] != null) {
      for (var result in json['results']) {
        MovieResult movieResult = MovieResult.fromJson(result);
        data.add(movieResult);
      }
    }
    return MovieData(results: data);
  }
}
