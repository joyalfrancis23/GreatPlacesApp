import 'dart:io';

import 'package:flutter/foundation.dart';

class Geography{
  final double latitute;
  final double longitude;
  final String address;
  Geography({@required this.latitute,@required this.longitude,this.address});
}
class Place{
  final String id;
  final String title;
  final Geography location;
  final File image;

  Place({@required this.id,@required this.title,@required this.location,@required this.image});
}