import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'DatabaseHelper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MovieForm extends StatefulWidget {
  @override
  _MovieFormState createState() => _MovieFormState();
}

class _MovieFormState extends State<MovieForm> {
  final String title = "Edit Movie Details";
  final ImagePicker picker = ImagePicker();
  File? imageFile = null;

  Future uploadImage() async {
    imageFile = File(await ImagePicker().pickImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));

    // final image = await picker.pickImage(source: ImageSource.gallery);
    // if(image != null)
    //   setState(() {
    //     imageFile = XFile(image.path);
    //   });
  }

  Widget getWidget() {
    if(imageFile != null)
      return Text("Image Uploaded Successfully", style: TextStyle(fontSize: 20, color: Colors.grey[600]));

    return
      TextButton(
        onPressed: uploadImage,
        child: Text("Select to upload an image", style: TextStyle(fontSize: 20, color: Colors.pinkAccent))
      );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final String movieId = routeArgs["id"]!.toString();
    final String movieName = routeArgs["name"]!.toString();
    final String genre = routeArgs["genre"]!.toString();
    final String movieGenre = genre.substring(1, genre.length-1);
    final String movieDuration = routeArgs["duration"]!.toString();
    final String movieImage = routeArgs["image"]!.toString();
    final String movieDescription = routeArgs["description"]!.toString();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(223, 238, 244, 1),
            Color.fromRGBO(243, 223, 240, 1)
          ]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          title: Text(title, style: TextStyle(color: Colors.grey[700])),
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.grey[700]),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              Image(image: AssetImage("images/logo.png")),
              Text("Mio Movie", style: TextStyle(color: Colors.pinkAccent, fontSize: 40, fontWeight: FontWeight.bold)),
              SizedBox(height: 40),
              TextFormField(
                initialValue: movieName,
                decoration: InputDecoration(
                    labelText: "Movie Name",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: movieGenre,
                decoration: InputDecoration(
                    labelText: "Movie Genre",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: movieDuration,
                decoration: InputDecoration(
                    labelText: "Movie Duration",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: movieDescription,
                decoration: InputDecoration(
                    labelText: "Movie Description",
                    border: OutlineInputBorder()
                ),
                maxLines: 4
              ),
              SizedBox(height: 8),
              getWidget(),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async{
                  final bytes = File(imageFile!.path).readAsBytesSync();
                  String _base64 = base64Encode(bytes);
                  int i = await DatabaseHelper.instance.insert({


                    DatabaseHelper.name: movieName,
                    DatabaseHelper.image: _base64,
                    DatabaseHelper.description: movieDescription,
                    DatabaseHelper.duration: movieDuration,
                    DatabaseHelper.genre: movieGenre

                  });
                  print(_base64);

                  Fluttertoast.showToast(
                      msg: "Data saved to sqflight database successfully",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                  print("Inserted at index : $i");
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    padding: const EdgeInsets.all(10),
                    fixedSize: Size.fromWidth(MediaQuery.of(context).size.width)
                ),
                child: Text("Save Changes", style: TextStyle(fontSize: 24, color: Colors.white))
              ),
              SizedBox(height: 16)
            ],
          ),
        ),
      ),
    );
  }
}
