import 'dart:io';

import 'package:flutter/material.dart';
import '../models/place.dart';
import '../helper/dbHelper.dart' as sqlHelper;

class GreatPlaces with ChangeNotifier{
  List<Place> _items = [];
  //using a getter to access the list from other palces
  List<Place> get items{
    return [..._items];
  }

  void addPlace(String titlePassed,File imageFile){
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: imageFile,
      location: null,
      title: titlePassed
      );
      _items.add(newPlace);
      notifyListeners();
      sqlHelper.DbHelper.insertinDataBase('userPlaces', {
        'id': newPlace.id,
        'title': newPlace.title,
        'image': newPlace.image.path,
      });
  }
  Future<void> fetchAndSetItems()async{
    final dataList = await sqlHelper.DbHelper.getData('userPlaces');
    _items = dataList.map((item)=> Place(
      id: item['id'],
      title: item['title'],
      image: File(item['image']),
      location: null
    )).toList();
    notifyListeners();
  }
}