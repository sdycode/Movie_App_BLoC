part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedState extends Equatable {
  final int currentTabIndex;
  const MovieTabbedState({this.currentTabIndex = 0});

  @override
  List<Object> get props => [currentTabIndex];
}

class MovieTabbedInitial extends MovieTabbedState {}

class MovieTabChangedState extends MovieTabbedState {
  final List<MovieEntity> movies;
  const MovieTabChangedState(int currentTabIndex ,{ required this.movies}):super(currentTabIndex: currentTabIndex);
   @override
  List<Object> get props => [currentTabIndex, movies];
}

class MovieTabLoadErrorState extends MovieTabbedState{
   const MovieTabLoadErrorState(int currentTabIndex ,):super(currentTabIndex: currentTabIndex);
  
}
