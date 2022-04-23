import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebaseapp/constant/loading.dart';
import 'package:firebaseapp/main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class storageScreen extends StatefulWidget {
  const storageScreen({Key? key}) : super(key: key);

  @override
  State<storageScreen> createState() => _storageScreenState();
}

class _storageScreenState extends State<storageScreen> {
  String imagePath = "";
  var file;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          file = await ImagePicker().pickImage(source: ImageSource.gallery);
          setState(() {
            imagePath = file!.path;
          });
        },
        child: const Icon(Icons.photo_library_rounded),
      ),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "FireStorage",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text(
                "Upload files to Firestorage",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blueAccent,
                  child: imagePath.isEmpty
                      ? const Icon(
                          Icons.image,
                          size: 100,
                        )
                      : Image.file(File(imagePath))),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 150,
                height: 50,
                color: Colors.amberAccent,
                child: isloading
                    ? loadingindicator()
                    : TextButton.icon(
                        onPressed: () async {
                          setState(() {
                            isloading = true;
                          });
                          await uploadImage(file);
                        },
                        icon: const Icon(
                          Icons.upload,
                          color: Colors.black,
                        ),
                        label: const Text(
                          "Upload",
                          style: TextStyle(color: Colors.black),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> uploadImage(XFile file) async {
    var ref = FirebaseStorage.instance.ref("files/${file.name}");
    await ref.putFile(File(file.path));
    setState(() {
      isloading = false;
    });
  }
}
