import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:greatPlaces_app/screens/places_list_screen.dart';
import './providers/greatPlace.dart';
import './screens/places_add_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
          child: MaterialApp(
        title: 'Great Places App',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          accentColor: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Placeslist(),
        routes: {
          AddPlaces.routes: (ctx)=> AddPlaces(),
        },
      ),
    );
  }
}

