import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable implements Exception {
  @override
  List<Object> get props => [];
}

class DioFailure extends Failure {
  @override
  final String message;
  final int statusCode;
  DioFailure({
    this.message,
    this.statusCode,
  });
}
