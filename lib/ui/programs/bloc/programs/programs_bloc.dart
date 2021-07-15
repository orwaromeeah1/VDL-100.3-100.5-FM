
import 'package:bloc/bloc.dart';
import 'package:vdl/data/models/category_model.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/data/responses/program_categories_response.dart';
import 'package:vdl/data/responses/programs_response.dart';
import 'package:vdl/ui/programs/bloc/programs/programs_event.dart';
import 'package:vdl/ui/programs/bloc/programs/programs_state.dart';




class ProgramsBloc extends Bloc<ProgramsEvent, ProgramsState> {
  final Repository repository;

  @override
  ProgramsBloc(ProgramsState initialState, this.repository) : super(initialState);

  @override
  ProgramsState get initialState => ProgramsEmpty();

  @override
  Stream<ProgramsState> mapEventToState(ProgramsEvent event) async* {
    if (event is FetchPrograms) {
      yield ProgramsLoading();
      try {

        List<ProgramsResponse> programs = await repository.getPrograms(1,100);

        yield ProgramsLoaded(programs: programs);
      } catch (_) {
        yield ProgramsError();
      }
    }
    if (event is FetchCategoryPrograms) {
      try {
        yield ProgramsLoading();
        List<ProgramsResponse> programs = await repository.getCategoryPrograms(event.categoryId,1,100);

        yield ProgramsLoaded(programs: programs);
      } catch (_) {
        yield CategoriesError();
      }
    }
    if (event is FetchCategories) {
      try {

        List<CategoryModel> categories = await repository.getProgramsCategories();

        yield CategoriesLoaded(categories: categories);
      } catch (_) {
        yield CategoriesError();
      }
    }

  }
}
