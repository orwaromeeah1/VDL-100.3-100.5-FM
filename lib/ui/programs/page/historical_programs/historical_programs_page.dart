import 'package:flutter/material.dart';
import 'package:vdl/ui/programs/page/program_details/program_details_page.dart';
import 'package:vdl/ui/programs/widget/program_card.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class HistoricalPrograms extends StatefulWidget {
  @override
  _HistoricalProgramsState createState() => _HistoricalProgramsState();
}

class _HistoricalProgramsState extends State<HistoricalPrograms> {
  double width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return  Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            // image
            new Column(
              children: <Widget>[
                new Container(
                  height: 200,
                  width: width,
                  color: ProjectColors.BLACK,
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'البرامج التاريخية',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            new Container(
                alignment: Alignment.bottomCenter,
                padding: new EdgeInsets.only(top: 200, right: 20.0, left: 20.0),
                child:ListView.builder(
                    itemCount: 2,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder:  (BuildContext context, int index){
                      return  GestureDetector(
                        onTap: ()=> Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => ProgramDetailsPage()
                            )
                        ),
                        child: Container(
                          child: ProgramCard(
                            image: 'https://www.vdl.me/wp-content/uploads/2021/05/Sawt-Jdid.jpg',
                            category: 'محلية',
                            name: 'صوت جديد',
                            date: 'الخميس 20 تشرين الثاني',
                          ),
                        ),
                      );
                    }
                )
            )
          ],
        ),
      ),
    );
  }
}
