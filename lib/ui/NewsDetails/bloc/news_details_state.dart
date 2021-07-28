import 'package:equatable/equatable.dart';
import 'package:vdl/data/models/aduio_response_model.dart';
import 'package:vdl/data/models/news_model.dart';

class NewsDetailsState extends Equatable {
  @override
  List<Object> get props => [];
}

class Loading extends NewsDetailsState {}

class Loaded extends NewsDetailsState {
  final NewsModel newsModel;

  Loaded(this.newsModel);
}

class AudioLoaded extends NewsDetailsState {
  final AudioResponseModel audio;
  final NewsModel data;
  AudioLoaded(this.audio, this.data);
}
