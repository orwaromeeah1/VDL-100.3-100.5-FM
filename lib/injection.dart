import 'package:audioplayers/audioplayers.dart';
import 'package:get_it/get_it.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:vdl/data/networking/http_client.dart';
import 'package:vdl/data/repository/repository.dart';
import 'package:vdl/ui/ArticleDetails/bloc/Article_details_bloc.dart';
import 'package:vdl/ui/ArticleDetails/bloc/article_details_state.dart';
import 'package:vdl/ui/Articles/bloc/articles_bloc.dart';
import 'package:vdl/ui/Articles/bloc/articles_state.dart';
import 'package:vdl/ui/NewsDetails/bloc/news_details_bloc.dart';
import 'package:vdl/ui/NewsDetails/bloc/news_details_state.dart';
import 'package:vdl/ui/news/bloc/news_bloc.dart';
import 'package:vdl/ui/news/bloc/news_state.dart';
import 'package:vdl/ui/news/bloc/search/search_bloc.dart';
import 'package:vdl/ui/news/bloc/search/search_state.dart';
import 'package:vdl/ui/news_broadcasts/bloc/news_broadcas_details/news_broadcast_details_bloc.dart';
import 'package:vdl/ui/news_broadcasts/bloc/news_broadcas_details/news_broadcast_details_state.dart';
import 'package:vdl/ui/news_broadcasts/bloc/news_cast_bloc.dart';
import 'package:vdl/ui/news_broadcasts/bloc/news_cast_state.dart';
import 'package:vdl/ui/programs/bloc/episode/episode_bloc.dart';
import 'package:vdl/ui/programs/bloc/episode/episode_state.dart';
import 'package:vdl/ui/programs/bloc/program_details/program_details_bloc.dart';
import 'package:vdl/ui/programs/bloc/program_details/program_details_state.dart';
import 'package:vdl/ui/programs/bloc/programs/programs_bloc.dart';
import 'package:vdl/ui/programs/bloc/programs/programs_state.dart';
import 'package:vdl/ui/programs_schedule/bloc/programs_schedule_state.dart';
import 'package:vdl/ui/programs_schedule/bloc/programsschedule_bloc.dart';
import 'package:vdl/utils/ads_manager/ad_state.dart';
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
  locator.registerLazySingleton(() => NewsBloc(locator(), locator()));
  locator.registerLazySingleton(() => AudioPlayer());
  locator.registerFactory(() => NewsState());

  //News Details Bloc
  locator.registerFactory(() => NewsDetailsBloc(locator(), locator()));
  locator.registerFactory(() => NewsDetailsState());

  //Articles  Bloc
  locator.registerFactory(() => ArticlesBLoc(locator(), locator()));
  locator.registerFactory(() => ArticlesState());

  //Articles Details  Bloc
  locator.registerFactory(() => ArticleDetailsBloc(locator(), locator()));
  locator.registerFactory(() => ArticleDetailsState());
  //ProgramsScreenBloc
  locator.registerFactory(() => ProgramsBloc(locator(), locator()));
  locator.registerFactory(() => ProgramsState());

  //ProgramDeteilsScreenBloc
  locator.registerFactory(() => ProgramDetailsBloc(locator(), locator()));
  locator.registerFactory(() => ProgramDetailsState());

  //SearchScreenBloc
  locator.registerFactory(() => SearchBloc(locator(), locator()));
  locator.registerFactory(() => SearchState());

  //NewsCastBloc
  locator.registerFactory(() => NewsCastBloc(locator(), locator()));
  locator.registerFactory(() => NewsCastState());

  //ProgramsScheduleBloc
  locator.registerFactory(() => ProgramsScheduleBloc(locator(), locator()));
  locator.registerFactory(() => ProgramsScheduleState());

//  locator.registerLazySingleton<AdState>(() => AdState(
//    initialization,
//  ));

  //NewsCastDetailsBloc
  locator.registerFactory(() => NewsCastDetailsBloc(locator(), locator()));
  locator.registerFactory(() => NewsCastDetailsState());

  //EpisodeBloc
  locator.registerFactory(() => EpisodeBloc(locator(), locator()));
  locator.registerFactory(() => EpisodeState());
}
