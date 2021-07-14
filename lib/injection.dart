import 'package:get_it/get_it.dart';
import 'package:vdl/data/networking/http_client.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/ui/news/bloc/search/search_bloc.dart';
import 'package:vdl/ui/news/bloc/search/search_state.dart';
import 'package:vdl/ui/programs/bloc/program_details/program_details_bloc.dart';
import 'package:vdl/ui/programs/bloc/program_details/program_details_state.dart';
import 'package:vdl/ui/programs/bloc/programs/programs_bloc.dart';
import 'package:vdl/ui/programs/bloc/programs/programs_state.dart';
import 'data/shared_preferences/auth_prefes_helper.dart';

final locator = GetIt.instance;

Future setLocator() async {
  locator.registerLazySingleton<HttpClient>(() => HttpClient());
  locator.registerLazySingleton<AuthPrefsHelper>(() => AuthPrefsHelper());

  locator.registerLazySingleton<Repository>(() => Repository(
        locator(),
        locator(),
      ));

  //ProgramsScreenBloc
  locator.registerFactory(() => ProgramsBloc(locator(), locator()));
  locator.registerFactory(() => ProgramsState());

  //ProgramDeteilsScreenBloc
  locator.registerFactory(() => ProgramDetailsBloc(locator(), locator()));
  locator.registerFactory(() => ProgramDetailsState());

  //SearchScreenBloc
  locator.registerFactory(() => SearchBloc(locator(), locator()));
  locator.registerFactory(() => SearchState());

}
