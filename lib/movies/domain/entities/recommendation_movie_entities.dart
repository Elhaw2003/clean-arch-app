import 'package:equatable/equatable.dart';

class RecommendationMovieEntities extends Equatable{
  final int id;
  final String backdropPath;
  const RecommendationMovieEntities({
    required this.id,
    required this.backdropPath,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id,backdropPath];
}