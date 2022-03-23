import 'dart:async';

import 'package:otp_text_field/otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/style.dart';

class signinwithmobile_screen extends StatefulWidget {
  signinwithmobile_screen({Key? key}) : super(key: key);

  @override
  State<signinwithmobile_screen> createState() =>
      _signinwithmobile_screenState();
}

class _signinwithmobile_screenState extends State<signinwithmobile_screen> {
  int start = 30;
  String button_name = "Send";
  bool sendbtn_enable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.amberAccent,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          "Sign in",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Enter your phone number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                        child: Text(
                          "+977",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      suffixIcon: InkWell(
                        onTap: sendbtn_enable
                            ? () {
                                setState(() {
                                  start = 30;
                                  timer();
                                  sendbtn_enable = !true;
                                  button_name = "Resend";
                                });
                              }
                            : null,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 8),
                          child: sendbtn_enable
                              ? Text(
                                  "$button_name",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              : Text(
                                  "$button_name",
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                    const Text(
                      "Enter 6 digit OTP",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ]),
                ),
                const SizedBox(height: 30),
                otp_field(context),
                const SizedBox(height: 30),
                RichText(
                  text: TextSpan(children: [
                    const TextSpan(
                      text: "Send OTP again in ",
                    ),
                    TextSpan(
                      text: "00:$start",
                      style: const TextStyle(color: Colors.red),
                    ),
                    const TextSpan(
                      text: " sec",
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 60,
                ),
                submit_btn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget otp_field(BuildContext context) {
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width,
      fieldWidth: 50,
      style: const TextStyle(fontSize: 17),
      otpFieldStyle: OtpFieldStyle(
        borderColor: Colors.black,
      ),
      keyboardType: TextInputType.number,
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.underline,
      onCompleted: (pin) {
        print("Completed: " + pin);
      },
    );
  }

  void timer() {
    const sec = Duration(seconds: 1);
    Timer timer = Timer.periodic(sec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          sendbtn_enable = true;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  Widget submit_btn() {
    return Container(
      height: 40,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.amberAccent,
      ),
      child: TextButton(
        onPressed: () {},
        child: const Text(
          "Submit",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
