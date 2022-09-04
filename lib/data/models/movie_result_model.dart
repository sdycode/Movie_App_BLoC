import 'package:bloc_movie/data/models/movie_model.dart';

class MovieResultModel {
  List<MovieModel> movies;

  MovieResultModel(this.movies);

factory MovieResultModel.fromJson(Map<String, dynamic> json) {
    var movies = List<MovieModel>.empty(growable: true);
    if (json['results'] != null) {
      json['results'].forEach((v) {
        final movieModel = MovieModel.fromJson(v);
          movies.add(movieModel);
        // if (_isValidMovie(movieModel)) {
        //   movies.add(movieModel);
        // }
      });
    }
    return MovieResultModel( movies);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    if (this.movies != null) {
      data['results'] = movies.map((v) => v.toJson()).toList();
    }

    return data;
  }
}
