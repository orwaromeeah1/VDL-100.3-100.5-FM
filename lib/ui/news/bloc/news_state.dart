import 'package:equatable/equatable.dart';
import 'package:vdl/data/models/homeModel.dart';
import 'package:vdl/data/models/menus_model.dart';

class NewsState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Loading extends NewsState {}

class Loaded extends NewsState {
  final HomeModel homeModel;
  Loaded(this.homeModel);
}

class Startup extends NewsState {
  final HomeModel homeModel;
  Startup(this.homeModel);
}

class FetchingCategoryNews extends NewsState {
  final HomeModel homeModel;

  FetchingCategoryNews(this.homeModel);
}

class FetchingNextPage extends NewsState {
  final HomeModel homeModel;
  FetchingNextPage(this.homeModel);
}

class MoveingToTop extends NewsState {
  final HomeModel homeModel;

  MoveingToTop(this.homeModel);
}

class NoInternetConnection extends NewsState {}
