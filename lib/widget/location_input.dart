import 'package:flutter/material.dart';
import 'package:location/location.dart';
class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _imagePreview;
  Future <void> _getLocation() async {
    final _locationData = await Location().getLocation();
    print(_locationData.latitude);
    print(_locationData.longitude);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(border:Border.all(color: Colors.grey,width:1)),
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          child: _imagePreview == null?Text("No Location chosen, Please choose one",textAlign: TextAlign.center,):
          Image.network(_imagePreview,fit: BoxFit.cover,width: 170,height: double.infinity,),
        ),//container to show either the location preview or the error message
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
           FlatButton.icon(onPressed: _getLocation,
            icon: Icon(Icons.location_pin),
             label: Text('Current Location'),
             textColor: Colors.blueAccent,
             ),
             FlatButton.icon(onPressed: (){},
            icon: Icon(Icons.map),
             label: Text('Pick a Location'),
             textColor: Colors.blueAccent,
             )
          ],),//Row is for setting up two buttons next to each other
      ],
    );
  }
}