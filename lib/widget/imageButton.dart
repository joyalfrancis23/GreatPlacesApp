import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as pathDefault;
import 'package:path/path.dart' as path;
class ImageInput extends StatefulWidget {
  final Function _selectedImage;
  ImageInput(this._selectedImage);
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;
  Future<void> _imagePickerTool() async{
    final _picker = ImagePicker();
    final _imagePicker = await _picker.getImage(source: ImageSource.camera,maxWidth: 600);
    if(_imagePicker==null){
      return;
    }
    setState(() {
      _storedImage = File(_imagePicker.path);
    });
    final _appDir = await pathDefault.getApplicationDocumentsDirectory();//gets a default path as per OS requirements
    final _fileName = path.basename(_imagePicker.path);//provides with the same name of the Clicked image
    final _imageStorage = await _storedImage.copy('${_appDir.path}/$_fileName');//stores the image in a path on the system
    widget._selectedImage(_imageStorage);
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
        onPressed: _imagePickerTool,
        ))
      ],
    );
  }
}