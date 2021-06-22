import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProgramCard extends StatelessWidget {
  final String name;
  final String image;
  final String category;
  final String date;

  ProgramCard({
    this.name,
    this.date,
    this.image,
    this.category
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          // image
          new Column(
            children: <Widget>[
              new Container(
                height: 200,
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     fit: BoxFit.cover,
                     image: NetworkImage( 'https://www.vdl.me/wp-content/uploads/2021/05/Sawt-Jdid.jpg',),
                   )
                 ),
//                 child:  CachedNetworkImage(
//                   imageUrl:  'https://www.wbcsd.org/var/site/storage/images/media/images/fresh_pa/80809-2-eng-GB/FRESH_PA_i1140.jpg',
//                   imageBuilder: (context, imageProvider) => Container(
//                       width: MediaQuery.of(context).size.width,
//                       padding: EdgeInsets.symmetric(horizontal: 25),
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: imageProvider,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//              ),
//                 ),
              ),
            ],
          ),
          new Container(
            alignment: Alignment.bottomCenter,
            padding: new EdgeInsets.only(
                top: 150,
                right: 20.0,
                left: 20.0),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 75.0,
                  width: MediaQuery.of(context).size.width,
                  //main card
                  child: new Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.white,
                    elevation: 2.5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$name',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                            ),
                          ),
                          Flex(
                              direction: Axis.horizontal,
                            children: [
                              Icon(
                                Icons.watch_later,
                                color: Colors.green,
                                size: 15,
                              ),
                              Text(
                                '$date',
                                style: TextStyle(
                                    color: Colors.grey
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                //category card
                new Container(
                  alignment: Alignment.topLeft,
                  padding: new EdgeInsets.only(
                      bottom: 30,
                      right: 20.0,
                      left: 20.0),
                  child: Transform.translate(
                    offset: Offset(0,-10),
                    child: new Container(
                      height: 30.0,
                      width: 50,
                      child: new Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        color: Colors.orangeAccent,
                        elevation: 2.5,
                        child: Text(
                          '$category',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                ),


              ],
            ),
          )
        ],
      ),
    );
  }
}
