import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class ProgramScheduleCard extends StatelessWidget {
  final String image;
  final String duration;
  final String name;
  final bool isDisplayingNow;

  ProgramScheduleCard({
    this.name,
    this.image,
    this.duration,
    this.isDisplayingNow:false,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: MediaQuery.of(context).size.width*0.8,
      padding: EdgeInsets.only(bottom: 15),
      child: Card(
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
                  ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flex(
              direction: Axis.horizontal,
              children: [
                CachedNetworkImage(
                  width:MediaQuery.of(context).size.width*0.4 ,
                   height: 100,
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
              onPressed: (){},
              icon: Icon(Icons.share),
            )
          ],
        ),
      ),
    );
  }
}
