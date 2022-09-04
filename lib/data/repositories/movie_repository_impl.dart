import 'package:bloc_movie/data/data_sources/movie_remote_data_source.dart';
import 'package:bloc_movie/data/models/movie_model.dart';
import 'package:bloc_movie/domain/entities/movie_entity.dart';
import 'package:bloc_movie/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/app_error.dart';

class MovieRepositoryImpl extends MovieRepository {
  MovieRemoteDataSource movieRemoteDataSource;
  MovieRepositoryImpl(this.movieRemoteDataSource);
  @override
  Future<Either<AppError, List<MovieEntity>>> getTrending() async {
    try {
      final movies = await movieRemoteDataSource.getTrending();
      return Right(movies);
    } on Exception {
      return const Left(AppError("Something went wrong "));
    }
  }
  
  @override
  Future<Either<AppError, List<MovieEntity>>> getNowPlaying()async {
     try {
      final movies = await movieRemoteDataSource.getNowPlaying();
      return Right(movies);
    } on Exception {
      return const Left(AppError("Something went wrong "));
    }
  }
  
  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular()async {
    try {
      final movies = await movieRemoteDataSource.getPopular();
      return Right(movies);
    } on Exception {
      return const Left(AppError("Something went wrong "));
    }
  }
  
  @override
  Future<Either<AppError, List<MovieEntity>>> getUpComing() async{
  try {
      final movies = await movieRemoteDataSource.getUpcoming();
      return Right(movies);
    } on Exception {
      return const Left(AppError("Something went wrong "));
    }
  }
}
