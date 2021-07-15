import 'package:get_it/get_it.dart';
import 'package:vdl/data/networking/http_client.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/ui/NewsDetails/bloc/news_details_bloc.dart';
import 'package:vdl/ui/NewsDetails/bloc/news_details_state.dart';
import 'package:vdl/ui/news/bloc/news_bloc.dart';
import 'package:vdl/ui/news/bloc/news_state.dart';
import 'data/shared_preferences/auth_prefes_helper.dart';

final locator = GetIt.instance;

Future setLocator() async {
  locator.registerLazySingleton<HttpClient>(() => HttpClient());
  locator.registerLazySingleton<AuthPrefsHelper>(() => AuthPrefsHelper());

  locator.registerLazySingleton<Repository>(() => Repository(
        locator(),
        locator(),
      ));

  //News Bloc
  locator.registerFactory(() => NewsBloc(locator(), locator()));
  locator.registerFactory(() => NewsState());

  //News Details Bloc
  locator.registerFactory(() => NewsDetailsBloc(locator(), locator()));
  locator.registerFactory(() => NewsDetailsState());
}
