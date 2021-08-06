import 'dart:developer';

//import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';

class AdState {
//  Future<InitializationStatus> initialization;

//  AdState(this.initialization);

  String get bannerAdUnitId => Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/2934735716';

//  BannerAdListener get adListener => _adListener;

//  BannerAdListener _adListener = BannerAdListener(
//    // Called when an ad is successfully received.
//    onAdLoaded: (Ad ad) => log('Ad loaded.'),
//    // Called when an ad request failed.
//    onAdFailedToLoad: (Ad ad, LoadAdError error) {
//      // Dispose the ad here to free resources.
//      ad.dispose();
//      log('Ad failed to load: $error');
//    },
//    // Called when an ad opens an overlay that covers the screen.
//    onAdOpened: (Ad ad) => log('Ad opened.'),
//    // Called when an ad removes an overlay that covers the screen.
//    onAdClosed: (Ad ad) => log('Ad closed.'),
//    // Called when an impression occurs on the ad.
//    onAdImpression: (Ad ad) => log('Ad impression.'),
//  );
}
