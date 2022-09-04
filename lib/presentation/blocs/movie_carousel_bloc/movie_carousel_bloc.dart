import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/entities/no_params.dart';
import '../../../domain/usecases/get_trending.dart';
import '../movie_backdrop/movie_backdrop_bloc.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;

  MovieCarouselBloc({
    required this.getTrending,
    required this.movieBackdropBloc,
  }) : super(MovieCarouselInitial()) {
    on<MovieCarouselEvent>((event, emit) async {
      if (event is CarouselLoadEvent) {
        final moviesEither = await getTrending(NoParams());

        moviesEither.fold(
          (l) => emit(MovieCarouselError()),
       
          (movies) {
            movieBackdropBloc
                .add(MovieBackdropChangedEvent(movies[event.defaultIndex]));
            return emit(MovieCarouselLoaded(
              movies: movies,
              defaultIndex: event.defaultIndex,
            ));
          },
        );
      }
    });
  }

}
