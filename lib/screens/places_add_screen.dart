
import 'package:flutter/material.dart';

import '../widget/imageButton.dart';

class AddPlaces extends StatefulWidget {
  static const routes = '/add-place-screen';
  @override
  _AddPlacesState createState() => _AddPlacesState();
}

class _AddPlacesState extends State<AddPlaces> {
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add a Place',textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),),
      
      body:Column(
        //No need to add crossAxisAllignment as we are using Expanded Column
        //the add button will stay at the bottom
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Expanded(child: SingleChildScrollView(
                  child: Column(children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                  contentPadding: EdgeInsets.all(5),
                ),
                controller: _textController,
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ImageInput(),
            ),
            
          ],),
        )),
        RaisedButton.icon(
          elevation: 0,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: (){},
          color: Colors.red[300],
           icon: Icon(Icons.add),
            label: Text('Add'),
            )
      ],)
    );
  }
}