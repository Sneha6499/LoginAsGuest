import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


enum ImageSourceType { gallery, camera }


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //late File _image=" " as File;
  var _image;
  var imagePicker;
  var type;

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Image Picker Example"),
        ),
        body: Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 300,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
                                child: const Text("Image from Camera"),
                                onPressed: () async {
                                  PickedFile pickedFile =
                                  await imagePicker.getImage(
                                    source: ImageSource.camera,
                                  );
                                  setState(() {
                                    if (pickedFile != null) {
                                      _image = File(pickedFile.path);
                                    } else {
                                      print('No image selected.');
                                    }
                                  });
                                  File image = File(pickedFile.path);
                                  _image= image;
                                },
                              ),
                              ElevatedButton(
                                child: const Text("Image from Gallery"),
                                onPressed: () async {
                                  PickedFile pickedFile =
                                  await imagePicker.getImage(
                                    source: ImageSource.gallery,
                                  );

                                  setState(() {
                                    if (pickedFile != null) {
                                      _image = File(pickedFile.path);
                                    } else {
                                      print('No image selected.');
                                    }
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },

                child:CircleAvatar(

                  radius: 100,
                  child: ClipRRect(

                    borderRadius: BorderRadius.circular(100),

                    child: _image != null
                        ? Image.file(
                      _image,
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.fitWidth,
                    )
                        :  Container( decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/camera.jpg"), fit: BoxFit.cover),
                    ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}




