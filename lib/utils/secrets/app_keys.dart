import 'package:vdl/data/models/credintals.dart';
import 'dart:io';

class AppKeys{

  static const String ANDROID_KEY = 'YOUR_ANDROID_KEY';
  static const String ANDROID_SECRET = ' YOUR_ANDROID_SECRET';
  static const String IOS_KEY = 'YOUR_IOS_KEY';
  static const String IOS_SECRET = 'YOUR_IOS_SECRET';


  static Credentials getCredentials(){
    if (Platform.isAndroid){
     return new Credentials(
       key: AppKeys.ANDROID_KEY,
       secret: AppKeys.ANDROID_SECRET
     );
    }
    if (Platform.isIOS){
      return new Credentials(
          key: AppKeys.IOS_KEY,
          secret: AppKeys.IOS_SECRET
      );
    }

    throw UnsupportedError('Unsupported platform');

  }


}
