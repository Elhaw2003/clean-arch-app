import 'package:equatable/equatable.dart';

class MovieDetailsEntities extends Equatable{
  final int id;
  final String title;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  final int runtime;
  final List<GenresEntities> genres;

  const MovieDetailsEntities({required this.id, required this.title, required this.backdropPath, required this.overview, required this.releaseDate, required this.voteAverage, required this.runtime, required this.genres});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    title,
    backdropPath,
    overview,
    releaseDate,
    voteAverage,
    runtime,
    genres
  ];
}
class GenresEntities extends Equatable{
  final int id;
  final String name;
  const GenresEntities({required this.id,required this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [id,name];
}