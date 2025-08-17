import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final String message;
  const Failure({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
class ApiFailure extends Failure {
  const ApiFailure({required super.message});
}