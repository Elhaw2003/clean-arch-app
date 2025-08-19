part of 'movie_details_bloc.dart';


abstract class MovieDetailsEvent extends Equatable{
  const MovieDetailsEvent();
}
class GetMovieDetailsEvent extends MovieDetailsEvent{
  final int id;
  const GetMovieDetailsEvent({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
class GetRecommendationMoviesEvent extends MovieDetailsEvent{
  final int id;
  const GetRecommendationMoviesEvent({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}