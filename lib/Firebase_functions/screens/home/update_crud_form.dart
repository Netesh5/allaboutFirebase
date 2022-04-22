import 'package:firebaseapp/constant/loading.dart';
import 'package:firebaseapp/model/user.dart';
import 'package:firebaseapp/services/database.dart';
import 'package:firebaseapp/services/db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class update_crud_form extends StatefulWidget {
  final String? id;
  String? title;
  String? task;
  String? timed;
  update_crud_form({this.title, this.task, this.timed, this.id});

  @override
  State<update_crud_form> createState() => update_crud_formState();
}

class update_crud_formState extends State<update_crud_form> {
  final _formkey = GlobalKey<FormState>();
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController timeinput = TextEditingController();
  String? _currentTask;
  String? _currentTitle;
  String? _currentTime;
  DatabaseService? _databaseService;
  db _db = db();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<users>(context);
    return StreamBuilder<userData>(
        stream: DatabaseService(uid: user.uid).datafromSnapshot,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //userData userdata = snapshot.data;
            return Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "To Do Task",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          initialValue: widget.title,
                          onChanged: (value) {
                            setState(() {
                              _currentTitle = value;
                            });
                          },
                          validator: (value) {
                            return value!.isEmpty ? "Enter Title" : null;
                          },
                          decoration: InputDecoration(
                              hintText: "Enter Title",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)))),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        initialValue: widget.task,
                        validator: (value) {
                          return value!.isEmpty ? "Enter Task" : null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _currentTask = value;
                          });
                        },
                        decoration: InputDecoration(
                            hintText: "Enter Task",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          controller: timeinput,
                          onTap: () async {
                            final TimeOfDay? timeOfDay = await showTimePicker(
                              context: context,
                              initialTime: selectedTime,
                              initialEntryMode: TimePickerEntryMode.dial,
                            );
                            if (timeOfDay != null &&
                                timeOfDay != selectedTime) {
                              setState(() {
                                selectedTime = timeOfDay;
                                timeinput.text =
                                    "${selectedTime.hour.toString()}"
                                    " : "
                                    "${selectedTime.minute.toString()}";
                                _currentTime = timeinput.text;
                              });
                            }
                          },
                          validator: (value) {
                            return value!.isEmpty ? "Enter Time" : null;
                          },
                          readOnly: true,
                          decoration: InputDecoration(
                              hintText: "Enter Time",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)))),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                // await DatabaseService(uid: user.uid)
                                //     .updateUserData(
                                //   _currentTitle!,
                                //   _currentTask!,
                                //   _currentTime!,
                                // );
                                _db.updateData(widget.id, _currentTitle,
                                    _currentTask, _currentTime, context);

                                Navigator.pop(context);
                              }
                            },
                            child: const Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                      )
                    ],
                  )),
            );
          } else {
            return loadingindicator();
          }
        });
  }
}
