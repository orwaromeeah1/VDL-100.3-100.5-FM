import 'package:get_it/get_it.dart';
import 'package:vdl/data/networking/http_client.dart';
import 'package:vdl/data/repository/repository.dart';
import 'data/shared_preferences/auth_prefes_helper.dart';

final locator = GetIt.instance;

Future setLocator() async {

  locator.registerLazySingleton<HttpClient>(() => HttpClient());
  locator.registerLazySingleton<AuthPrefsHelper>(() => AuthPrefsHelper());


  locator.registerLazySingleton<Repository>(
      () => Repository(locator(), locator(),)
  );



 }
