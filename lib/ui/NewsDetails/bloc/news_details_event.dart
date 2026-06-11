import 'package:equatable/equatable.dart';

class NewsDetailsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchNewsDetails extends NewsDetailsEvent {
  final int id;
  final bool isSpecail;
  FetchNewsDetails(this.id, this.isSpecail);
}

class FetchAudio extends NewsDetailsEvent {
  final String id;

  FetchAudio(this.id);
}
