import 'package:flutter/material.dart';

import 'package:maps_launcher/maps_launcher.dart';

class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Maps',
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => MapsLauncher.launchQuery(
                    'store that sells farm products in France'),
                child: Text('LAUNCH QUERY'),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () =>
                    MapsLauncher.launchCoordinates(48.8566, 2.3522),
                child: Text('LAUNCH COORDINATES'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
