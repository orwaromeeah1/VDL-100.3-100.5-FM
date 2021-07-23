import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:vdl/data/responses/news_cast_response.dart';


 class NewsCastState extends Equatable {
  const NewsCastState();

  @override
  List<Object> get props => [];
}

class NewsCastEmpty extends NewsCastState {}

class NewsCastLoading extends NewsCastState {}

class NewPageLoading extends NewsCastState {}

class NewsCastLoaded extends NewsCastState {
  final List<NewsCastResponse> newsCasts;

  const NewsCastLoaded({@required this.newsCasts}) : assert(newsCasts != null);

  @override
  List<Object> get props => [newsCasts];
}
class NewsCastError extends NewsCastState {}

