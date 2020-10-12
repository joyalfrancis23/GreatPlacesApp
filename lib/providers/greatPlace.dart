import 'package:flutter/material.dart';
import '../models/place.dart';

class GreatPlaces with ChangeNotifier{
  List<Place> _items = [];
  //using a getter to access the list from other palces
  List<Place> get items{
    return [..._items];
  }

}