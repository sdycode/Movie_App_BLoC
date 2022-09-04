import 'package:bloc_movie/domain/entities/app_error.dart';
import 'package:bloc_movie/domain/entities/movie_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>>> getTrending();
  Future<Either<AppError, List<MovieEntity>>> getPopular();

  Future<Either<AppError, List<MovieEntity>>> getNowPlaying();
  Future<Either<AppError, List<MovieEntity>>> getUpComing();
}
