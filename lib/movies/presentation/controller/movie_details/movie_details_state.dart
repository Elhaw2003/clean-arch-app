part of 'movie_details_bloc.dart';

 class MovieDetailsState extends Equatable {
  final MovieDetailsEntities? movieDetailsEntities;
  final RequestState movieDetailsRequestState;
  final String movieDetailsErrorMessage;

  const MovieDetailsState({
    this.movieDetailsEntities,
    this.movieDetailsRequestState = RequestState.loading,
    this.movieDetailsErrorMessage = "",
  });

  MovieDetailsState copyWith({
    MovieDetailsEntities? movieDetailsEntities,
    RequestState? movieDetailsRequestState,
    String? movieDetailsErrorMessage,
  })
  {
    return MovieDetailsState(
      movieDetailsEntities: movieDetailsEntities ?? this.movieDetailsEntities,
      movieDetailsRequestState: movieDetailsRequestState ?? this.movieDetailsRequestState,
      movieDetailsErrorMessage: movieDetailsErrorMessage ?? this.movieDetailsErrorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    movieDetailsEntities,
    movieDetailsRequestState,
    movieDetailsErrorMessage
  ];
}
