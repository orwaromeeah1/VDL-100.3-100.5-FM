import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EpisodeCard extends StatelessWidget {
  final String episodeNumber;
  final String date;
  final String image;
  final String title;
  final String audioLink;
  final String videoLink;

  EpisodeCard({
    this.date,
    this.audioLink,
    this.episodeNumber,
    this.title,
    this.image,
    this.videoLink,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      padding: EdgeInsets.only(bottom: 14),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CachedNetworkImage(
                width:MediaQuery.of(context).size.width*0.3 ,
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
                    '$episodeNumber - $date',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.53,
                    child: Text(
                      '$title',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(

                    width: MediaQuery.of(context).size.width*0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flex(
                          direction: Axis.horizontal,
                          children: [
                           Icon(Icons.headset,color: Colors.blue,),
                            Text(
                              'استمع الآن',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        Flex(
                          direction: Axis.horizontal,
                          children: [
                            Icon(Icons.play_arrow,color: Colors.green,),
                            Text(
                              'شاهد الآن',
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
