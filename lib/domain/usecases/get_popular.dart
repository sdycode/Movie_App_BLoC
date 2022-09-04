import 'package:bloc_movie/domain/entities/app_error.dart';
import 'package:bloc_movie/domain/entities/movie_entity.dart';
import 'package:bloc_movie/domain/repositories/movie_repository.dart';
import 'package:bloc_movie/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../entities/no_params.dart';

class GetPopular extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository movieRepository;
  GetPopular(this.movieRepository);

  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await movieRepository.getPopular();
  }
}
