import 'package:equatable/equatable.dart';

class Error extends Equatable implements Exception {
  @override
  List<Object> get props => [];
}

class NetworkingError extends Error {}

class BadRequestError extends Error {
  final String message;

  BadRequestError(this.message);
}

class AlreadyInCart extends Error {}

class NoInternetConnection implements Error {
  @override
  List<Object> get props => [];
}

class IncorrectData extends Error {}
