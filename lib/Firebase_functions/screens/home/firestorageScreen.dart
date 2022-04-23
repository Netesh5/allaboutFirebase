import 'package:flutter/material.dart';

class storageScreen extends StatefulWidget {
  const storageScreen({Key? key}) : super(key: key);

  @override
  State<storageScreen> createState() => _storageScreenState();
}

class _storageScreenState extends State<storageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
                child: const Icon(
                  Icons.image,
                  size: 100,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 150,
                color: Colors.amberAccent,
                child: TextButton.icon(
                    onPressed: () {},
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
}
