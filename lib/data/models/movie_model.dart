import 'package:bloc_movie/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final bool? adult;
  final String backdropPath;
  final int id;
  final String title;
  final String? originalLanguage;
  final String? originalTitle;
  final String overview;
  final String posterPath;
  final String? mediaType;
  final List<int>? genreIds;
  final double? popularity;
  final String releaseDate;
  final bool? video;
  final double voteAverage;
  final int? voteCount;

  MovieModel(
      {this.adult,
      required this.backdropPath,
      required this.id,
      required this.title,
      this.originalLanguage,
      this.originalTitle,
      required this.overview,
      required this.posterPath,
      this.mediaType,
      this.genreIds,
      this.popularity,
      required this.releaseDate,
      this.video,
      required this.voteAverage,
      this.voteCount})
      : super(
          id: id,
          title: title,
          backdropPath: backdropPath,
          posterPath: posterPath,
          releaseDate: releaseDate,
          voteAverage: voteAverage,
          overview: overview,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        adult : json['adult'],
        backdropPath : json['backdrop_path'] ??'',
        id : json['id'] ?? -1,
        title : json['title'],
        originalLanguage : json['original_language'],
        originalTitle : json['original_title'],
        overview : json['overview'],
        posterPath : json['poster_path'],
        mediaType : json['media_type'],
        genreIds : json['genre_ids'].cast<int>(),
        popularity : json['popularity']?.toDouble() ?? 0.0,
        releaseDate : json['release_date'],
        video : json['video'],
        voteAverage : json['vote_average']?.toDouble() ?? 0.0,
        voteCount : json['vote_count']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = this.id;
    data['video'] = this.video;
    data['vote_count'] = this.voteCount;
    data['vote_average'] = this.voteAverage;
    data['title'] = this.title;
    data['release_date'] = this.releaseDate;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['genre_ids'] = this.genreIds;
    data['backdrop_path'] = this.backdropPath;
    data['adult'] = this.adult;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    return data;
  }
}
