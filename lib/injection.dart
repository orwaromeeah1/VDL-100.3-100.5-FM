import 'package:audioplayers/audioplayers.dart';
import 'package:get_it/get_it.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:vdl/data/networking/http_client.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/ui/ArticleDetails/bloc/Article_details_bloc.dart';
import 'package:vdl/ui/Articles/bloc/articles_bloc.dart';
import 'package:vdl/ui/NewsDetails/bloc/news_details_bloc.dart';
import 'package:vdl/ui/live_broadcast/bloc/live_podcast_bloc.dart';
import 'package:vdl/ui/live_broadcast/page/live_audio/live_audio_page.dart';
import 'package:vdl/ui/live_broadcast/page/live_audio/live_audio_android_page.dart';
import 'package:vdl/ui/news/bloc/news_bloc.dart';
import 'package:vdl/ui/news/bloc/search/search_bloc.dart';
import 'package:vdl/ui/news_broadcasts/bloc/news_broadcas_details/news_broadcast_details_bloc.dart';
import 'package:vdl/ui/news_broadcasts/bloc/news_cast_bloc.dart';
import 'package:vdl/ui/notifications/bloc/notifications_bloc.dart';
import 'package:vdl/ui/programs/bloc/episode/episode_bloc.dart';
import 'package:vdl/ui/programs/bloc/program_details/program_details_bloc.dart';
import 'package:vdl/ui/programs/bloc/programs/programs_bloc.dart';
import 'package:vdl/ui/programs_schedule/bloc/programsschedule_bloc.dart';
import 'data/shared_preferences/auth_prefes_helper.dart';

final locator = GetIt.instance;

Future setLocator(/*Future<InitializationStatus> initialization*/) async {
  locator.registerLazySingleton<HttpClient>(() => HttpClient());
  locator.registerLazySingleton<AuthPrefsHelper>(() => AuthPrefsHelper());

  locator.registerLazySingleton<Repository>(() => Repository(
        locator(),
        locator(),
      ));

  //News Bloc
  locator.registerLazySingleton(() => NewsBloc(locator()));
  locator.registerLazySingleton(() => LivePodcastBloc());
  locator.registerLazySingleton(() => AudioPlayer());
  locator.registerLazySingleton(() => BackGroundAudioPlayer());
  locator.registerLazySingleton(() => BackGroundAndroidAudioPlayer());

  //News Details Bloc
  locator.registerFactory(() => NewsDetailsBloc(locator()));

  //Articles  Bloc
  locator.registerFactory(() => ArticlesBLoc(locator()));

  //NotificationBloc  Bloc
  locator.registerFactory(() => NotificationBloc(locator()));

  //Articles Details  Bloc
  locator.registerFactory(() => ArticleDetailsBloc(locator()));

  //ProgramsScreenBloc
  locator.registerFactory(() => ProgramsBloc(locator()));

  //ProgramDeteilsScreenBloc
  locator.registerFactory(() => ProgramDetailsBloc(locator()));

  //SearchScreenBloc
  locator.registerFactory(() => SearchBloc(locator()));

  //NewsCastBloc
  locator.registerFactory(() => NewsCastBloc(locator()));

  //ProgramsScheduleBloc
  locator.registerFactory(() => ProgramsScheduleBloc(locator()));

//  locator.registerLazySingleton<AdState>(() => AdState(
//    initialization,
//  ));

  //NewsCastDetailsBloc
  locator.registerFactory(() => NewsCastDetailsBloc(locator()));

  //EpisodeBloc
  locator.registerFactory(() => EpisodeBloc(locator()));

  ///
}
