import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebaseapp/constant/loading.dart';
import 'package:firebaseapp/services/db.dart';
import 'package:flutter/material.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:image_picker/image_picker.dart';

class storageDownloadScreen extends StatefulWidget {
  String downloadUrl = "";
  storageDownloadScreen({Key? key, required this.downloadUrl})
      : super(key: key);

  @override
  State<storageDownloadScreen> createState() => _storageDownloadScreenState();
}

class _storageDownloadScreenState extends State<storageDownloadScreen> {
  String imagePath = "";
  var file;
  bool isloading = false;
  db _db = db();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     file = await ImagePicker().pickImage(source: ImageSource.gallery);
      //     setState(() {
      //       imagePath = file!.path;
      //     });
      //   },
      //   child: const Icon(Icons.photo_library_rounded),
      // ),
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
                  child: widget.downloadUrl.isEmpty
                      ? const Icon(
                          Icons.image,
                          size: 100,
                        )
                      : Image.network(widget.downloadUrl)),
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
                          // if (file != null) {
                          //   setState(() {
                          //     isloading = true;
                          //   });
                          // }
                          try {
                            setState(() {
                              isloading = true;
                            });
                            await ImageDownloader.downloadImage(
                                    widget.downloadUrl)
                                .then((value) => _db.showsnackbar(
                                    context, "Download sucessfully"));
                            setState(() {
                              isloading = false;
                            });
                          } catch (e) {
                            _db.showsnackbar(context, "Download failed");
                          }
                        },
                        icon: const Icon(
                          Icons.download,
                          color: Colors.black,
                        ),
                        label: const Text(
                          "Download",
                          style: TextStyle(color: Colors.black),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> uploadImage(XFile file) async {
  //   var ref = FirebaseStorage.instance.ref("files/${file.name}");
  //   var result = await ref
  //       .putFile(File(file.path))
  //       .then((p0) => _db.showsnackbar(context, "File uploaded"));
  //   setState(() {
  //     isloading = false;
  //   });
  // }
}
