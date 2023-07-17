import 'dart:math';

import 'package:exam_one/Global/Global_var.dart';
import 'package:exam_one/Helper/ApiHelper.dart';
import 'package:exam_one/Model/Api_model.dart';
import 'package:exam_one/Provider/theme_provider.dart';
import 'package:exam_one/views/screens/Save_page.dart';
import 'package:exam_one/views/screens/mark_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  int s = 0;
  int m = 0;
  int h = 0;
  int date = 0 ;
  int month = 0 ;
  int year = 0 ;


  myTime() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        s = DateTime.now().second;
        m = DateTime.now().minute;
        h = DateTime.now().hour;
        date = DateTime.now().day;
        month = DateTime.now().month;
        year = DateTime.now().year;
      });
      myTime();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myTime();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          "Digital Clock",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: (Provider.of<theme_provider>(context)
                .app_theme
                .isDark
                ? Colors.black
                : Colors.white),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: (Provider.of<theme_provider>(context).app_theme.isDark
            ? Colors.black
            : Colors.white),
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(),
            ),
            ListTile(
              leading: (Provider.of<theme_provider>(context).app_theme.isDark
                  ? Icon(
                      CupertinoIcons.sun_max,
                      color:
                          (Provider.of<theme_provider>(context).app_theme.isDark
                              ? Colors.white
                              : Colors.black),
                    )
                  : Icon(
                      CupertinoIcons.moon,
                      color:
                          (Provider.of<theme_provider>(context).app_theme.isDark
                              ? Colors.white
                              : Colors.black),
                    )),
              title: Text(
                "Theme",
                style: (Provider.of<theme_provider>(context).app_theme.isDark
                    ? const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)
                    : const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('setting_page');
              },
              trailing: Padding(
                padding: const EdgeInsets.all(10),
                child: Switch(
                    value:
                        Provider.of<theme_provider>(context).app_theme.isDark,
                    onChanged: (val) {
                      Provider.of<theme_provider>(context, listen: false)
                          .change_app_theme(val);
                    }),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("$date : $month : $year",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: (Provider.of<theme_provider>(context)
                          .app_theme
                          .isDark
                          ? Colors.black
                          : Colors.white),
                    ),),
                    (h == 13)
                        ? Text(
                      "$h  : $m : $s \n        AM",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: (Provider.of<theme_provider>(context)
                            .app_theme
                            .isDark
                            ? Colors.black
                            : Colors.white),
                      ),
                    )
                        : Text(
                      "${h - 12} : $m : $s \n  PM",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: (Provider.of<theme_provider>(context)
                            .app_theme
                            .isDark
                            ? Colors.black
                            : Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 400,
                decoration: BoxDecoration(
                    color:
                        (Provider.of<theme_provider>(context).app_theme.isDark
                            ? Colors.grey
                            : Colors.deepPurple),
                    shape: BoxShape.circle),
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ...List.generate(
                        60,
                        (index) => Transform.rotate(
                          angle: (index / 60) * (3 * pi / 2 * 2),
                          child: Divider(
                            thickness: (index % 5 == 0) ? 5 : 2,
                            endIndent: w * 0.95,
                            color:
                                (index % 5 == 0) ? Colors.red : Colors.yellow,
                          ),
                        ),
                      ),
                      //second
                      Transform.rotate(
                        angle: 3 * pi / 2,
                        child: Transform.rotate(
                          angle: (s / 60) * (3 * pi / 2 / 2),
                          child: Divider(
                            thickness: 4,
                            color: Colors.blue,
                            indent: w * 0.5,
                            endIndent: 20,
                          ),
                        ),
                      ),
                      //minutes
                      Transform.rotate(
                        angle: 3 * pi / 2,
                        child: Transform.rotate(
                          angle: (m / 60) * (3 * pi / 2 / 2),
                          child: Divider(
                            thickness: 4,
                            color: Colors.blueAccent,
                            indent: w * 0.5,
                            endIndent: 50,
                          ),
                        ),
                      ),
                      //hour
                      Transform.rotate(
                        angle: 3 * pi / 2,
                        child: Transform.rotate(
                          angle: (h / 12) * (3 * pi / 2 / 2),
                          child: Divider(
                            thickness: 4,
                            color: Colors.lightBlue,
                            indent: w * 0.5,
                            endIndent: 80,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextButton(
                      child: const Text("Save Time",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          'save_page',
                          arguments: s,
                        );
                        if (!time2.contains(h)) {
                          time.add(h);
                        }
                        if (!time1.contains(m)) {
                          time.add(m);
                        }
                        if (!time.contains(s)) {
                          time.add(s);
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: TextButton(
                      child: const Text("Add Mark",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                      onPressed: () {
                                Navigator.of(context).pushNamed('mark_page');
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
