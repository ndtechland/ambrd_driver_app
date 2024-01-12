import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';

class MyAppTestingUrl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Maps Launcher Demo',
          ),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              ElevatedButton(
                onPressed: () => MapsLauncher.launchQuery(
                    '1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA'),
                child: Text('LAUNCH QUERY'),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => MapsLauncher.launchCoordinates(
                    25.612677, 85.158875, 'Bihar are here'),
                child: Text('LAUNCH COORDINATES'),
              ),
            ])));
  }
}
