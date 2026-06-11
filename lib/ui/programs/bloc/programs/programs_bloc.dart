
import 'package:bloc/bloc.dart';
import 'package:vdl/data/models/category_model.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/data/responses/programs_response.dart';
import 'package:vdl/ui/programs/bloc/programs/programs_event.dart';
import 'package:vdl/ui/programs/bloc/programs/programs_state.dart';


class ProgramsBloc extends Bloc<ProgramsEvent, ProgramsState> {
  final Repository repository;

  ProgramsBloc(this.repository) : super(ProgramsEmpty()) {
    on<FetchPrograms>(_onFetchPrograms);
    on<FetchCategoryPrograms>(_onFetchCategoryPrograms);
    on<SearchPrograms>(_onSearchPrograms);
    on<FetchCategories>(_onFetchCategories);
  }

  Future<void> _onFetchPrograms(
      FetchPrograms event, Emitter<ProgramsState> emit) async {
    emit(ProgramsLoading());
    try {
      List<ProgramsResponse> programs = await repository.getPrograms(1, 100);
      emit(ProgramsLoaded(programs: programs));
    } catch (_) {
      emit(ProgramsError());
    }
  }

  Future<void> _onFetchCategoryPrograms(
      FetchCategoryPrograms event, Emitter<ProgramsState> emit) async {
    try {
      emit(ProgramsLoading());
      List<ProgramsResponse> programs =
          await repository.getCategoryPrograms(event.categoryId, 1, 100);
      emit(ProgramsLoaded(programs: programs));
    } catch (_) {
      emit(CategoriesError());
    }
  }

  Future<void> _onSearchPrograms(
      SearchPrograms event, Emitter<ProgramsState> emit) async {
    try {
      emit(ProgramsLoading());
      List<ProgramsResponse> programs = await repository.programsSearch(
          event.categoryId, 1, 100, event.searchQuery);
      emit(ProgramsLoaded(programs: programs));
    } catch (_) {
      emit(CategoriesError());
    }
  }

  Future<void> _onFetchCategories(
      FetchCategories event, Emitter<ProgramsState> emit) async {
    try {
      List<CategoryModel> categories =
          await repository.getProgramsCategories();
      emit(CategoriesLoaded(categories: categories));
    } catch (_) {
      emit(CategoriesError());
    }
  }
}
