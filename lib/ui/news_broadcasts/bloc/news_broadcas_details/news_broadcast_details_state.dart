import 'package:equatable/equatable.dart';
import 'package:vdl/data/models/aduio_response_model.dart';

class NewsCastDetailsState extends Equatable {
  @override
  List<Object> get props => [];
}

class AudiosLoading extends NewsCastDetailsState {}

class AudiosLoaded extends NewsCastDetailsState {

  final AudioResponseModel introAudio;
  final AudioResponseModel fullAudio;

  AudiosLoaded({required this.introAudio, required this.fullAudio});
}

class AudiosError extends NewsCastDetailsState {}