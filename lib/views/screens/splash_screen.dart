import 'dart:async';

import 'package:flutter/material.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('home_page');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                alignment: Alignment.center,
                height: 300,
                width: double.infinity,
                child: Image.network(
                    "https://media0.giphy.com/media/QBd2kLB5qDmysEXre9/giphy.gif?cid=ecf05e47dampmjbjlcj9puiclsqpiwku3r3d5eonouoy5ac7&rid=giphy.gif&ct=g"),
              ),
            ),
          ),
          const Center(
            child: Text(
              "Just Wait Application is on Load",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10,),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
