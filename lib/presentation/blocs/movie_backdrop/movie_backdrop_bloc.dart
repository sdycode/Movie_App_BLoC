import 'package:bloc/bloc.dart';
import 'package:bloc_movie/domain/entities/movie_entity.dart';
import 'package:equatable/equatable.dart';

part 'movie_backdrop_event.dart';
part 'movie_backdrop_state.dart';

class MovieBackdropBloc extends Bloc<MovieBackdropEvent, MovieBackdropState> {
  MovieBackdropBloc() : super(MovieBackdropInitial()) {
    on<MovieBackdropEvent>((event, emit) {
      emit(MovieBackdropChanged((event as MovieBackdropChangedEvent).movie) );
    });
  }

}
