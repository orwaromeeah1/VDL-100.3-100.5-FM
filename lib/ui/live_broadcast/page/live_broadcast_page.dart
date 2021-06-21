
import 'package:flutter/material.dart';

class LiveBroadcastPage extends StatefulWidget {
  @override
  _LiveBroadcastPageState createState() => _LiveBroadcastPageState();
}

class _LiveBroadcastPageState extends State<LiveBroadcastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text('live broadcast'),
        ),
      ),
    );
  }
}
