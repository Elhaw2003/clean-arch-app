import 'package:clean_arch_app/core/utilities/request_enum.dart';
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

  MovieStates copyWith({
    List<NowPlayingEntities>? nowPlayingMoviesList,
    List<PopularEntities>? popularMoviesList,
    List<TopRatedEntities>? topRatedMoviesList,
    RequestState? nowPlayingMoviesRequestState,
    RequestState? popularMoviesRequestState,
    RequestState? topRatedMoviesRequestState,
    String? nowPlayingMoviesErrorMessage,
    String? popularMoviesErrorMessage,
    String? topRatedMoviesErrorMessage,
  }) {
    return MovieStates(
      nowPlayingMoviesList: nowPlayingMoviesList ?? this.nowPlayingMoviesList,
      popularMoviesList: popularMoviesList ?? this.popularMoviesList,
      topRatedMoviesList: topRatedMoviesList ?? this.topRatedMoviesList,
      nowPlayingMoviesRequestState: nowPlayingMoviesRequestState ?? this.nowPlayingMoviesRequestState,
      popularMoviesRequestState: popularMoviesRequestState ?? this.popularMoviesRequestState,
      topRatedMoviesRequestState: topRatedMoviesRequestState ?? this.topRatedMoviesRequestState,
      nowPlayingMoviesErrorMessage: nowPlayingMoviesErrorMessage ?? this.nowPlayingMoviesErrorMessage,
      popularMoviesErrorMessage: popularMoviesErrorMessage ?? this.popularMoviesErrorMessage,
      topRatedMoviesErrorMessage: topRatedMoviesErrorMessage ?? this.topRatedMoviesErrorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    nowPlayingMoviesList,nowPlayingMoviesRequestState,nowPlayingMoviesErrorMessage,popularMoviesList,popularMoviesRequestState,popularMoviesErrorMessage,topRatedMoviesList,topRatedMoviesRequestState,topRatedMoviesErrorMessage
  ];
}