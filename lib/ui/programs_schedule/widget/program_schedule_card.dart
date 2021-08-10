import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:share/share.dart';
import 'package:vdl/ui/live_broadcast/widget/live_stream_button.dart';
import 'package:vdl/ui/programs/page/program_details/program_details_page.dart';
import 'package:vdl/utils/project_colors/project_color.dart';


class ProgramScheduleCard extends StatelessWidget {
  final String image;
  final String duration;
  String link;
  final int id;
  final String name;
  final bool isDisplayingNow;

  ProgramScheduleCard({
    this.name,
    this.image,
    this.duration,
    this.id,
    this.link,
    //TODO : show something if program is displaying now
    this.isDisplayingNow:false,
});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        id != 0
            ? Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => ProgramDetailsPage(programId: id,)
            )
        )
             :null;
      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.8,
        child: Column(
          children: [
            Container(
              height: 125,
              width: MediaQuery.of(context).size.width*0.8,
              padding: EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      CachedNetworkImage(
                        width:140 ,
                        height: 80,

                        imageUrl:  '$image',
                        imageBuilder: (context, imageProvider) => Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$duration',
                            style: TextStyle(
                                color: ProjectColors.ThemeColor
                            ),
                          ),
                          Text(
                            '$name',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: (){
                      Share.share(link);
                    },
                    icon: Icon(Icons.share),
                  )
                ],
              ),
            ),
            Container(width: MediaQuery.of(context).size.width,
             height: 1,
              color: Colors.grey,
            )
          ],
        ),
      )
    );
  }
}
