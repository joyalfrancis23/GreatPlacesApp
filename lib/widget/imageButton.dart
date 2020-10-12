import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;
  Future<void> _image_picker_tool() async{
    final _picker = ImagePicker();
    final _image_picker = await _picker.getImage(source: ImageSource.camera,maxWidth: 600);
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border:Border.all(width:1,color:Colors.black12)),
          alignment: Alignment.center,
          width: 100,
          height: 100,
          child: _storedImage!=null?Image.file(_storedImage,
          fit: BoxFit.cover,
          
          width: double.infinity,
          ):Text('Image not found!!!',textAlign: TextAlign.center,style: TextStyle(letterSpacing: 1.5),),
        ),
        SizedBox(width:10),
        Expanded(
          child: FlatButton.icon(icon: Icon(Icons.camera,color: Colors.blue,),
        label: Text('Take a picture',textAlign: TextAlign.center,style: TextStyle(color:Colors.blue,letterSpacing: 2),),
        onPressed: _image_picker_tool,
        ))
      ],
    );
  }
}