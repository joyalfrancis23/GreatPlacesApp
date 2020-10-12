//This is the first screen of the application 
import 'package:flutter/material.dart';

import './places_add_screen.dart';

class Placeslist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Great Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
           onPressed: (){
             Navigator.of(context).pushNamed(AddPlaces.routes);
           }
           )
        ],
      ),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}