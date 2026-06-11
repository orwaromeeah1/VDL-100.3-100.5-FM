
import 'package:vdl/data/models/news_broadcast_model.dart';

class DaysNewsBroadcasts{
  bool isOpened;
  String? date;
  List<NewsBroadcast>? broadcasts;

  DaysNewsBroadcasts({
    this.date,
    this.broadcasts,
    this.isOpened = false,
});

}