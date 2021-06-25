import 'package:flutter/material.dart';
import 'package:vdl/ui/programs/widget/category_widget.dart';
import 'package:vdl/ui/programs/widget/program_card.dart';
import 'package:vdl/data/models/category_model.dart';
import 'package:vdl/ui/programs/page/program_details/program_details_page.dart';
import 'package:vdl/ui/shared_widget/glowing_circular_button.dart';
import 'package:vdl/utils/file_path/file_path.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class ProgramsPage extends StatefulWidget {
  @override
  _ProgramsPageState createState() => _ProgramsPageState();
}

class _ProgramsPageState extends State<ProgramsPage> {
  double width;
  final GlobalKey<FormState> _searchFormKey = GlobalKey<FormState>();
  final TextEditingController _searchController = TextEditingController();
  List<Widget> categoriesWidget = [] ;

  //fake data
  List<Category> categories =[
    new Category (id: '1',name: 'أرشيف'),
    new Category (id: '1',name: 'ثقافة'),
    new Category (id: '1',name: 'سياسة'),
    new Category (id: '1',name: 'فن'),
    new Category (id: '1',name: 'اقتصاد'),
    new Category (id: '1',name: 'صحة'),
    new Category (id: '1',name: 'شبابي'),
    new Category (id: '1',name: 'منوعات'),
    new Category (id: '1',name: 'مجتمع'),
  ];


  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    _getCategoriesWidget();


    return Scaffold(
//      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Container(
                  height: 300,
                  width: width,
                  color: ProjectColors.BLACK,
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
                              child:GlowingCircularButton(
                                size: 40,
                                color: ProjectColors.ThemeColor,
                                onClick: (){
                                  _modalBottomSheetMenu();
                                },
                                iconImage: FilePath.FILTER,
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
                padding: new EdgeInsets.only(top: 200, right: 20.0, left: 20.0,bottom: 50),
                child:ListView.builder(
                    itemCount: 5,
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
              child :StatefulBuilder(builder: (context, setState) {
                return new Container(

                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                            GestureDetector(
                              onTap: (){
//                                setState(() {
//                                });
                              },
                              child: Text(
                                'الغاء',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: ProjectColors.ThemeColor
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 150,
                          child: GridView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {},
                                child: Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                         categories[index].isSelected = !categories[index].isSelected;
                                      });
                                    },
                                    child: CategoryWidget(
                                      name: categories[index].name,
                                      isSelected: categories[index].isSelected,
                                    )
                                  ),
                                ),
                              );
                            },
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 3,
                                childAspectRatio: (2/1)),
                            itemCount: categories.length,
                            shrinkWrap: true,
                          ),
                        ),

                      ],
                    )
                );
              }
            )
          );
        }
    );
  }

  _getCategoriesWidget(){
    categories.forEach((element) {categoriesWidget.add(
       Container(
         width: 75,
         height: 50,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(15),
           border: Border.all(
             color: Colors.grey,
             width: 1,
           )
         ),
         padding: EdgeInsets.all(5),
         child: new Center(
            child: Text(
              element.name
            ),
          ),
       )
    );
    });
  }
}
