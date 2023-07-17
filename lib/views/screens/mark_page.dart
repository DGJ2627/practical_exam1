import 'package:exam_one/Global/Global_var.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mark_page extends StatefulWidget {
  const mark_page({Key? key}) : super(key: key);

  @override
  State<mark_page> createState() => _mark_pageState();
}

class _mark_pageState extends State<mark_page> {


  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: const [
          Icon(Icons.date_range_outlined),
          SizedBox(
            width: 10,
          ),
        ],
        title: const Text(
          "To-Do App",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              i,
              (index) => Container(
                height: h * 0.09,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(bottom: 10),
                      height: h * 0.07,
                      width: w * 0.1,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: (){
                          timeList[index].remove(i);
                        },
                        child: Text(
                          "${timeList[index]['time']}:00\n ${timeList[index]['status']}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          margin: const EdgeInsets.only(bottom: 10),
                          height: h * 0.09,
                          width: w * 0.35,
                          child: const TextField(
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              hintText: "Enter your TO-Do here...",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          setState(() {
            timeList.add({
              "time": (i + 9 <= 12) ? i + 9 : (i + 9) - 12,
              'status': (i + 9 <= 12) ? "AM" : "PM",
            });
            i++;
          });
        },
       child: Icon(Icons.add),
      )
    );
  }
}
