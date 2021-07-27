import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:vdl/data/responses/program_details_response.dart';
import 'package:vdl/ui/programs/bloc/program_details/program_details_bloc.dart';
import 'package:vdl/ui/programs/bloc/program_details/program_details_event.dart';
import 'package:vdl/ui/programs/bloc/program_details/program_details_state.dart';
import 'package:vdl/ui/programs/widget/episode_card.dart';
import 'package:vdl/ui/shared_widget/error_screen.dart';
import 'package:vdl/ui/shared_widget/glowing_circular_button.dart';
import 'package:vdl/ui/shared_widget/loading_screen.dart';
import 'package:vdl/utils/ads_manager/ad_state.dart';
import 'package:vdl/utils/file_path/file_path.dart';
import 'package:vdl/utils/project_colors/project_color.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';

import '../../../../injection.dart';

class ProgramDetailsPage extends StatefulWidget {
  final int programId;

  ProgramDetailsPage({this.programId});

  @override
  _ProgramDetailsPageState createState() => _ProgramDetailsPageState();
}

class _ProgramDetailsPageState extends State<ProgramDetailsPage> {
  double width;
  ProgramDetailsResponse program;
  final _bloc = locator<ProgramDetailsBloc>();

  BannerAd banner;

  @override
  void initState() {
    _bloc.add(FetchProgramDetails(programId: widget.programId));
    super.initState();


  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final  adState = locator<AdState>();
    adState.initialization.then((value) {
      setState(() {
        banner = BannerAd(
          adUnitId: adState.bannerAdUnitId,
          size: AdSize.mediumRectangle,
          request: AdRequest(),
          listener: adState.adListener
        )..load();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return BlocBuilder(
        bloc: _bloc,
        builder: (context, ProgramDetailsState state) {
          if (state is ProgramDetailsEmpty) {
            _bloc.add(FetchProgramDetails());
          }
          if (state is ProgramDetailsError) {
            return ErrorScreen(
              onRetry: () => _bloc.add(FetchProgramDetails()),
            );
          }
          if (state is ProgramDetailsLoaded) {
            program = state.program;
            return screenUi();
          }

          if (state is ProgramDetailsLoading) {
            return LoadingScreen();
          }

          return Center(
            child: LoadingScreen(),
          );
        });
  }


  Widget screenUi(){
      banner.load();
    return Scaffold(
      body: Container(
        width: width,
        child: Stack(
          children: <Widget>[
            // image
            Positioned(
              top:0,
              child: new Column(
                children: <Widget>[
                  new Container(
                      height: 250,
                      width: width,
                      padding: EdgeInsets.only(top: 37),
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: '${program.image.original}',
                            imageBuilder: (context, imageProvider) =>
                                Container(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  padding: EdgeInsets.symmetric(horizontal: 25),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                          ),
                          Positioned(
                              top: 10,
                              left: 10,
                              child: GlowingCircularButton(
                                color: Colors.black26,
                                onClick:(){
                                  Navigator.pop(context);
                                },
                                size: 35,
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                ),
                              )

                          ),


                        ],
                      )
                  ),
                ],
              ),
            ),

            new Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(top:215),
              padding:
              new EdgeInsets.only(top: 0, right: 10.0, left: 10.0),
              child:Flex(
                crossAxisAlignment: CrossAxisAlignment.start,
                direction: Axis.vertical,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [


                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child:GlowingCircularButton(
                          size: 50,
                          color: Colors.white,
                          onClick: (){
                            Share.share(program.link);
                          },
                          iconImage: FilePath.SHARE,
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20,left: 20),
                        child: GlowingCircularButton(
                          size: 50,
                          color: ProjectColors.ThemeColor,
                          isGlowing: true,
                          onClick: (){},
                          icon: Icon(
                            Icons.volume_down,
                            color: Colors.white,
                          ),
                        ),

                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.6,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            '${Bidi.stripHtmlIfNeeded(program.programInfoDescription)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Flex(
                            direction: Axis.horizontal,
                            children: [
                              Icon(Icons.watch_later,color: ProjectColors.ThemeColor,),
                              Text(
                                  '${program.programTextTime}'
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          banner == null
                          ?Container(height: 20)
                          :Container(
                            height: 250,
                            child: AdWidget(
                              ad: banner,
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text(
                            'الحلقات',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: program.episodes.length,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context,int index){
                                return EpisodeCard(
                                  image: '${program.episodes[index].image.original}',
                                  date: '${program.humanDate}',
                                  title: '${program.episodes[index].title}',
                                  episodeNumber: 'الحلقة ${index+1}',
                                );
                              }

                          ),
                          SizedBox(height:50),
                        ],
                      ),
                    ),
                  )
                ],
              ),

            )
          ],
        ),


      ),
    );
  }

}
