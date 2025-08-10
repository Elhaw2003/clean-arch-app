import 'package:equatable/equatable.dart';

class Movie extends Equatable{
  final String backdropPath;
  final int id;
  final List<int> genreIds;
  final String overview;
  final String title;
  final double voteAverage;

 const Movie({required this.backdropPath, required this.id, required this.genreIds, required this.overview, required this.title, required this.voteAverage});

  @override
  // TODO: implement props
  List<Object?> get props => [backdropPath, id, genreIds, overview, title, voteAverage];
}














