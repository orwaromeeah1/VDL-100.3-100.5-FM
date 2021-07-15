import 'package:equatable/equatable.dart';

class NewsDetailsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchNewsDetails extends NewsDetailsEvent {
  final int id;

  FetchNewsDetails(this.id);
}
