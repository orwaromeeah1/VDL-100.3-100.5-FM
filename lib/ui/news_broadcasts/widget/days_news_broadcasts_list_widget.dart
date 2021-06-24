import 'package:flutter/material.dart';
import 'package:vdl/data/models/news_broadcast_model.dart';

class DaysNewsBroadcastsWidget extends StatelessWidget {
  final List<NewsBroadcast> broadcasts;

  DaysNewsBroadcastsWidget({
    this.broadcasts,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
      child: ListView.builder(
        itemCount: broadcasts.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context,int index){
        return Container(
          padding: const EdgeInsets.all(8.0),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flex(
                direction: Axis.horizontal,
                children: [
                  Text(
                      '${broadcasts[index].time}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Text(
                    'استمع الآن',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  Icon(
                    Icons.headset,
                    color: Colors.green,
                  )
                ],
              ),
            ],
          )
        );
      }),
    );
  }
}
