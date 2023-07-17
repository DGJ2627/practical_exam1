import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class intro_screens extends StatefulWidget {
  const intro_screens({super.key});

  @override
  State<intro_screens> createState() => _intro_screensState();
}

class _intro_screensState extends State<intro_screens> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              image: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQeKfTDAzG2XsW7S6vV9qrq9VyIeBVYSv6bL0RIp-C2YUyOWff0xm_DADlEMhbcQ1H2wA&usqp=CAU",height: 600,),
              //image: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRB4rMennIv5E4LoOT-2-b0a90kmUFjhPtNlg&usqp=CAU") ,
              //Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCXFDu1FjrH6GOWOMoXc-2OvLkLRKYr8VZFg&usqp=CAU",),
              title: "Time you enjoy wasting is not wasted time.",
              body: "",
            ),
          ],
          showBackButton: false,
          showNextButton: true,
          back: const Icon(CupertinoIcons.back),
          overrideNext: const Text(""),
          done: const Text("Done"),
          onDone: () async {
            Navigator.of(context).pushNamed('splash_screen');
            SharedPreferences pref = await SharedPreferences.getInstance();

            pref.setBool("intro_completed", true);
          },
        ),
      ),
    );
  }
}
