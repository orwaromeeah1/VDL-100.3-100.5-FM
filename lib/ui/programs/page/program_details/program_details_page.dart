
import 'package:flutter/material.dart';
import 'package:vdl/ui/programs/widget/episode_card.dart';

class ProgramDetailsPage extends StatefulWidget {
  @override
  _ProgramDetailsPageState createState() => _ProgramDetailsPageState();
}

class _ProgramDetailsPageState extends State<ProgramDetailsPage> {
  double width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context,int index){
                    return EpisodeCard(
                      image: 'https://www.vdl.me/wp-content/uploads/2021/05/Sawt-Jdid.jpg',
                      date: '23 شباط 2020',
                      title: 'عقد المكتب السياسي اجتماعه الاسبوعي برئاسة رئيس الحزب',
                      episodeNumber: 'الحلقة الأولى',
                    );
                  }

              ),

            ],
          ),
        ),
      ),
    );
  }
}
