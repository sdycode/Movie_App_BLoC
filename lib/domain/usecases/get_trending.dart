import 'package:bloc_movie/domain/entities/app_error.dart';
import 'package:bloc_movie/domain/entities/movie_entity.dart';
import 'package:bloc_movie/domain/entities/no_params.dart';
import 'package:bloc_movie/domain/repositories/movie_repository.dart';
import 'package:bloc_movie/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetTrending extends UseCase<List<MovieEntity>, NoParams>{
  final MovieRepository movieRepository;
  GetTrending(this.movieRepository);

  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await movieRepository.getTrending();
  }
  
}
