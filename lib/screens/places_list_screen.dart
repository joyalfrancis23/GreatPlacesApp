//This is the first screen of the application 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './places_add_screen.dart';
import '../providers/greatPlace.dart';

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
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context,listen: false).fetchAndSetItems(),//provides with the fetching function which returns a future
        builder:(ctx,snapshot) => snapshot.connectionState == ConnectionState.waiting?Center(child:CircularProgressIndicator()):Consumer<GreatPlaces>(
        child:Center(child: Text('Oops you havent added any places!!!\n\nAdd some by clicking on the add button\n\t    on the topright corner'),),
        builder: (ctx,greatplace,ch)=> greatplace.items.length<=0?ch:ListView.builder(
          itemCount: greatplace.items.length,
          itemBuilder:  (ctx,index) => ListTile(
            leading: CircleAvatar(backgroundImage: FileImage(greatplace.items[index].image),),
            title: Text(greatplace.items[index].title),
            onTap: () {
              
            },
          ),
          ),
      ),)
    );
  }
}