import 'package:equatable/equatable.dart';

class NowPlayingEntities extends Equatable{
  final String backdropPath;
  final int id;
  final List<int> genreIds;
  final String overview;
  final String title;
  final double voteAverage;

  const NowPlayingEntities({required this.backdropPath, required this.id, required this.genreIds, required this.overview, required this.title, required this.voteAverage});

  @override
  // TODO: implement props
  List<Object?> get props => [backdropPath, id, genreIds, overview, title, voteAverage];
}














