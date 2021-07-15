import 'package:flutter/material.dart';
import 'package:vdl/data/models/news_broadcast_model.dart';
import 'package:vdl/ui/news_broadcasts/page/news_broadcast_details/news_broadcast_details_page.dart';
import 'package:vdl/utils/file_path/file_path.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class DaysNewsBroadcastsWidget extends StatelessWidget {
  final List<String> broadcasts;

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
        return GestureDetector(
          onTap: ()=> Navigator.push(
              context,
             MaterialPageRoute(
                 builder: (context) => NewsBroadcastDeteilsPage()
             )
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 15),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Image.asset(FilePath.PREVIOUS_BROADCAST,height: 25,width: 25,),
                    SizedBox(width: 10,),
                    Text(
                        '${getTimeSlut(broadcasts[index])}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Icon(
                      Icons.headset,
                      color: ProjectColors.ThemeColor,
                    ),
                    Text(
                      'استمع الآن',
                      style: TextStyle(
                        color: ProjectColors.ThemeColor,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ),
        );
      }),
    );
  }

  String getTimeSlut(String s)=> s.replaceAll('_', ':');
}
