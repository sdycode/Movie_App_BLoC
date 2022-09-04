import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_movie/domain/entities/app_error.dart';
import 'package:bloc_movie/domain/entities/movie_entity.dart';
import 'package:bloc_movie/domain/entities/no_params.dart';
import 'package:bloc_movie/domain/usecases/get_nowplaying.dart';
import 'package:bloc_movie/domain/usecases/get_popular.dart';
import 'package:bloc_movie/domain/usecases/get_upcoming.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'movie_tabbed_event.dart';
part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetPopular getPopular;
  final GetNowPlaying getNowPlaying;
  final GetUpComing getUpComing;
  MovieTabbedBloc(
      {required this.getPopular,
      required this.getNowPlaying,
      required this.getUpComing})
      : super(MovieTabbedInitial()) {
    on<MovieTabbedEvent>((event, emit) async {
      if (event is MovieTabChanged) {
        log('event called ${event.currentTabIndex}');
        Either<AppError, List<MovieEntity>> moviesEither;

        switch (event.currentTabIndex) {
          case 0:
            moviesEither = await getPopular(NoParams());

            break;
          case 1:
            moviesEither = await getNowPlaying(NoParams());

            break;
          case 2:
            moviesEither = await getUpComing(NoParams());

            break;
          default:
            moviesEither = await getPopular(NoParams());
        }
        moviesEither.fold(
            (l) =>
            emit(MovieTabLoadErrorState(event.currentTabIndex),),
             
            (movies) =>
              emit(  MovieTabChangedState(event.currentTabIndex, movies: movies)));
      }
    });
  }
}
