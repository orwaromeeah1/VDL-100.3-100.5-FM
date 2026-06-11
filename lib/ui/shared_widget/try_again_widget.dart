import 'package:flutter/material.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

// Widget tryAgain(BuildContext context, void ontap) {
//   return Container(
//     height: MediaQuery.of(context).size.height,
//     width: MediaQuery.of(context).size.width,
//     child: InkWell(
//       onTap: () => ontap,
//       child: Center(
//         child: Container(
//           height: 50,
//           width: 100,
//           decoration: BoxDecoration(
//               border: Border.all(width: 1, color: blue),
//               borderRadius: BorderRadius.circular(10)),
//           child: Center(
//             child: Text('Try again'),
//           ),
//         ),
//       ),
//     ),
//   );
// }

typedef RetryCallBack = void Function();

class TryAgain extends StatelessWidget {
  final RetryCallBack onRetry;

  TryAgain({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: () => onRetry,
        child: Center(
          child: Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
                border: Border.all(width: 4, color: green),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                'Try again',
                style: TextStyle(color: green),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
