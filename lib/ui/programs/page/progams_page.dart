import 'package:flutter/material.dart';
import 'package:vdl/ui/programs/widget/program_card.dart';

class ProgramsPage extends StatefulWidget {
  @override
  _ProgramsPageState createState() => _ProgramsPageState();
}

class _ProgramsPageState extends State<ProgramsPage> {
  double width;
  final GlobalKey<FormState> _searchFormKey = GlobalKey<FormState>();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return Scaffold(
//      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            // image
            new Column(
              children: <Widget>[
                new Container(
                  height: 300,
                  width: width,
                  color: Colors.black87,
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'البرامج',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      Form(
                        key: _searchFormKey,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 60,
                              width: width * 0.65,
                              child: Card(
                                elevation: 10,
                                color: Colors.white12,
                                margin: EdgeInsets.only(top: 20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.transparent,
                                  ),
                                  child: TextFormField(
                                    controller: _searchController,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: Colors.white,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        labelText: 'إضغط للبحث هنا',
                                        labelStyle:
                                            TextStyle(color: Colors.white)),
//                                 textInputAction: TextInputAction.next,
//                               onEditingComplete: () => node.nextFocus(),
                                    // Move focus to next
//                                 validator: (result) {
//                                   if (result.isEmpty) {
//                                     return '';
//                                   }
//                                   return null;
//                                 },
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () => _modalBottomSheetMenu(),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Icon(
                                    Icons.filter_list,
                                    color: Colors.orangeAccent,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            new Container(
                alignment: Alignment.bottomCenter,
                padding: new EdgeInsets.only(top: 250, right: 20.0, left: 20.0),
                child: Column(
                  children: [
                    ProgramCard(
                      category: 'محلية',
                      name: 'صوت جديد',
                      date: 'الخميس 20 تشرين الثاني',
                    ),
                    ProgramCard(
                      category: 'محلية',
                      name: 'صوت جديد',
                      date: 'الخميس 20 تشرين الثاني',
                    ),
                    ProgramCard(
                      category: 'محلية',
                      name: 'صوت جديد',
                      date: 'الخميس 20 تشرين الثاني',
                    ),
                  ],
                ))
          ],
        ),
      ),
    );


  }

  void _modalBottomSheetMenu(){
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(50.0),
            topRight: const Radius.circular(50.0))
      ),
        context: context,
        builder: (builder){
          return new Container(
            height: 250.0,
            color: Colors.transparent,
              padding: EdgeInsets.all(20),//could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(

                child:Column(
                 children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flex(
                         direction: Axis.horizontal,
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.close,
                                color: Colors.grey,
                                size: 35,
                              ),
                              onPressed:()=> Navigator.pop(context)
                          ),
                          Text(
                            'تصنيف النتائج',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),

                      Text(
                        'الغاء',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.green
                        ),
                      ),
                    ],
                  )
                 ],
          )
            )
          );
        }
    );
  }
}
