import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NewsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchData extends NewsEvent {}

class FetchCategoryNews extends NewsEvent {
  final int catId;
  final int page;
  FetchCategoryNews(this.catId, this.page);
}

class FetchSpecialReportsPages extends NewsEvent {
  final int page;

  FetchSpecialReportsPages(this.page);
}

class MoveToTop extends NewsEvent {}

class FetchCategories extends NewsEvent {
  final int page;

  FetchCategories(this.page);
}
