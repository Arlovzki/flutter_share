import 'package:flutter/material.dart';
import 'package:flutter_share/widgets/header.dart';

class ActivityFeed extends StatefulWidget {
  @override
  _ActivityFeedState createState() => _ActivityFeedState();
}

class _ActivityFeedState extends State<ActivityFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context,isAppTitle: false, titleText: 'Activity Feed'),
      body: Text('Activity Feed'),
    );
  }
}

class ActivityFeedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: header(context,isAppTitle: false, titleText: 'Activity Feed'),
      body: Text('Activity Feed'),
    );
  }
}
