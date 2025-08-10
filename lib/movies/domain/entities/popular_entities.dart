import 'package:equatable/equatable.dart';

class PopularEntities extends Equatable{
  final String backdropPath;
  final int id;
  final List<int> genreIds;
  final String overview;
  final String title;
  final String releaseDate;
  final double voteAverage;

  const PopularEntities({required this.backdropPath, required this.id, required this.genreIds, required this.overview, required this.title, required this.voteAverage,required this.releaseDate});

  @override
  // TODO: implement props
  List<Object?> get props => [backdropPath, id, genreIds, overview, title, voteAverage];
}














