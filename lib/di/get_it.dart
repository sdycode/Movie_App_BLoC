import 'package:bloc_movie/data/core/api_client.dart';
import 'package:bloc_movie/data/data_sources/movie_remote_data_source.dart';
import 'package:bloc_movie/data/repositories/movie_repository_impl.dart';
import 'package:bloc_movie/domain/repositories/movie_repository.dart';
import 'package:bloc_movie/domain/usecases/get_nowplaying.dart';
import 'package:bloc_movie/domain/usecases/get_popular.dart';
import 'package:bloc_movie/domain/usecases/get_trending.dart';
import 'package:bloc_movie/domain/usecases/get_upcoming.dart';
import 'package:bloc_movie/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:bloc_movie/presentation/blocs/movie_carousel_bloc/movie_carousel_bloc.dart';
import 'package:bloc_movie/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getItInstance()));

  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));

  getItInstance
      .registerLazySingleton<GetUpComing>(() => GetUpComing(getItInstance()));

  getItInstance.registerLazySingleton<GetNowPlaying>(
      () => GetNowPlaying(getItInstance()));
  getItInstance.registerFactory(() => MovieBackdropBloc());
  getItInstance.registerFactory(() => MovieCarouselBloc(
      getTrending: getItInstance(), movieBackdropBloc: getItInstance()));

  getItInstance.registerFactory(() => MovieTabbedBloc(
      getPopular: GetPopular(getItInstance()),
      getNowPlaying: GetNowPlaying(getItInstance()),
      getUpComing: GetUpComing(getItInstance())));
}
