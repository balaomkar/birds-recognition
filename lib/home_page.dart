import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'prediction_page.dart';

class Options extends StatelessWidget {
  const Options({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:Text("Welcome!"),
      ),
      body:Option(),
    );
  }
}

class Option extends StatefulWidget {
  const Option({Key? key}) : super(key: key);

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  File? imageFile;
  Future pickGallery() async
  {
    final image=await ImagePicker().pickImage(source:ImageSource.gallery);
    if(image==null) return;
    final imageTemp=File(image.path);
    setState(()=>this.imageFile=imageTemp);
    XFile file = new XFile(imageTemp.path);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => PredictionPage(image: (file))));
  }
  Future pickCamera() async
  {
    final image=await ImagePicker().pickImage(source:ImageSource.camera);
    if(image==null) return;
    final imageTemp=File(image.path);
    setState(()=>this.imageFile=imageTemp);
    XFile file = new XFile(imageTemp.path);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => PredictionPage(image: (file))));
  }
  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [imageFile!=null?Image.file(imageFile!,width: 160,height: 160,fit: BoxFit.cover,):FlutterLogo(size:160),
        Text("Select image from"),
        SizedBox(height: 20),
        ElevatedButton(onPressed:()=>pickGallery(),child: Text("Gallery")),
        SizedBox(height: 20),
        Text("OR"),
        SizedBox(height: 20),
        ElevatedButton(onPressed: ()=>pickCamera(), child: Text("Camera"))
      ],
    ),);
  }
}
