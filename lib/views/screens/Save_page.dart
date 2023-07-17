import 'package:exam_one/Global/Global_var.dart';
import 'package:exam_one/Provider/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class save_page extends StatefulWidget {
  const save_page({super.key});

  @override
  State<save_page> createState() => _save_pageState();
}

class _save_pageState extends State<save_page> {
  int s = 0;
  int m = 0;
  int h = 0;
  int date = 0;

  int month = 0;

  int year = 0;

  myTime() {
    Future.delayed(const Duration(seconds: 1), () {
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Save Time",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: (Provider.of<theme_provider>(context).app_theme.isDark
                ? Colors.black
                : Colors.white),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            time = [];
            time1 = [];
            time2 = [];
            Navigator.pop(context);
          },
          icon: const Icon(CupertinoIcons.back),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 500,
                  height: 500,
                  child: Image.network("https://i.gifer.com/7YyR.gif")),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...time1
                      .map(
                        (e) => Text(
                          "$e  ",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: (Provider.of<theme_provider>(context)
                                    .app_theme
                                    .isDark
                                ? Colors.black
                                : Colors.white),
                          ),
                        ),
                      )
                      .toList(),
                  ...time
                      .map(
                        (e) => Text(
                          "$e  ",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: (Provider.of<theme_provider>(context)
                                    .app_theme
                                    .isDark
                                ? Colors.black
                                : Colors.white),
                          ),
                        ),
                      )
                      .toList(),
                  ...time2
                      .map(
                        (e) => Text(
                          "$e  ",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: (Provider.of<theme_provider>(context)
                                    .app_theme
                                    .isDark
                                ? Colors.black
                                : Colors.white),
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "$date / $month /$year",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: (Provider.of<theme_provider>(context).app_theme.isDark
                      ? Colors.black
                      : Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
