import 'package:flutter/material.dart';
import 'package:vdl/ui/shared_widget/glowing_circular_button.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class NewsBroadcastPlayer extends StatelessWidget {
  final String duration;
  final String title;
  final String audioLink;
  final String description;

  NewsBroadcastPlayer({
    required this.audioLink,
    required this.duration,
    this.description = '',
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    GlowingCircularButton(
                      size: 25,
                      color: ProjectColors.ThemeColor,
                      icon:Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 15,
                      ),
                      onClick: (){},
                      isGlowing: true,
                    ),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${title}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.keyboard_voice,
                              color: ProjectColors.ThemeColor,
                            ),
                            Text(
                              '01:55',
                              style: TextStyle(
                                  color: Colors.grey
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Icon(
                    Icons.share
                )
              ],
            ),
            description != ''
                ?Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                  '${description}'
              ),
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}



