import 'package:flutter/material.dart';

class crud_form extends StatefulWidget {
  const crud_form({Key? key}) : super(key: key);

  @override
  State<crud_form> createState() => _crud_formState();
}

class _crud_formState extends State<crud_form> {
  final _formkey = GlobalKey<FormState>();
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController timeinput = TextEditingController();
  String? _currentTask;
  String? _currentTitle;
  String? _currentTime;
  @override
  Widget build(BuildContext context) {
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
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  onChanged: (value) {
                    setState(() {
                      _currentTitle = value;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Title",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)))),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  _currentTask = value;
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
                    if (timeOfDay != null && timeOfDay != selectedTime) {
                      setState(() {
                        selectedTime = timeOfDay;
                        timeinput.text = "${selectedTime.hour.toString()}"
                            " : "
                            "${selectedTime.minute.toString()}";
                        _currentTime = timeinput.text;
                      });
                    }
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
                      debugPrint(_currentTitle);
                      debugPrint(_currentTask);
                      debugPrint(_currentTime);
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
              )
            ],
          )),
    );
  }
}
