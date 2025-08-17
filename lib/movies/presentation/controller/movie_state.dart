import 'package:clean_arch_app/core/utilities/request_enum.dart';
import 'package:clean_arch_app/movies/data/models/now_playing_movies_model.dart';
import 'package:clean_arch_app/movies/domain/entities/now_playing_entities.dart';
import 'package:clean_arch_app/movies/domain/entities/popular_entities.dart';
import 'package:clean_arch_app/movies/domain/entities/top_rated_entities.dart';
import 'package:equatable/equatable.dart';

class MovieStates extends Equatable {
  final List<NowPlayingEntities> nowPlayingMoviesList;
  final List<PopularEntities> popularMoviesList;
  final List<TopRatedEntities> topRatedMoviesList;
  final RequestState nowPlayingMoviesRequestState;
  final RequestState popularMoviesRequestState;
  final RequestState topRatedMoviesRequestState;
  final String nowPlayingMoviesErrorMessage;
  final String popularMoviesErrorMessage;
  final String topRatedMoviesErrorMessage;
  const MovieStates({
    this.popularMoviesRequestState = RequestState.loading,
    this.topRatedMoviesRequestState = RequestState.loading,
    this.nowPlayingMoviesList = const [],
    this.popularMoviesList = const [],
    this.topRatedMoviesList = const [],
    this.nowPlayingMoviesRequestState = RequestState.loading,
    this.nowPlayingMoviesErrorMessage = "",
    this.popularMoviesErrorMessage = "",
    this.topRatedMoviesErrorMessage = "",
});

  @override
  // TODO: implement props
  List<Object?> get props => [nowPlayingMoviesList,nowPlayingMoviesRequestState,nowPlayingMoviesErrorMessage];
}