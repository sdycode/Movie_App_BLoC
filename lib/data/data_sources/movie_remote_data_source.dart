import 'dart:convert';
import 'dart:developer';

import 'package:bloc_movie/data/core/api_client.dart';
import 'package:bloc_movie/data/core/api_constants.dart';
import 'package:bloc_movie/data/models/movie_model.dart';
import 'package:bloc_movie/data/models/movie_result_model.dart';
import 'package:http/http.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();

  Future<List<MovieModel>> getUpcoming();
  Future<List<MovieModel>> getNowPlaying();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;
  MovieRemoteDataSourceImpl(this._client);
  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get("trending/movie/day");
    final trendingmoviees = MovieResultModel.fromJson(response).movies;
    // log(trendingmoviees.toString());
    return trendingmoviees;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await _client.get("movie/popular");
    final trendingmoviees = MovieResultModel.fromJson(response).movies;
    // log(trendingmoviees.toString());
    return trendingmoviees;
  }

  @override
  Future<List<MovieModel>> getNowPlaying() async {
    final response = await _client.get("movie/now_playing");
    final trendingmoviees = MovieResultModel.fromJson(response).movies;
    // log(trendingmoviees.toString());
    return trendingmoviees;
  }

  @override
  Future<List<MovieModel>> getUpcoming() async {
    final response = await _client.get("movie/upcoming");
    final trendingmoviees = MovieResultModel.fromJson(response).movies;
    // log(trendingmoviees.toString());
    return trendingmoviees;
  }
}
