// import 'dart:ffi';

import 'package:app_conver/view/componend/Golbel.dart';
import 'package:flutter/material.dart';

class home_Page extends StatefulWidget {
  const home_Page({super.key});

  @override
  State<home_Page> createState() => _home_PageState();
}

class _home_PageState extends State<home_Page> {
  DateTime k = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: Goldes.l
          .map(
            (e) => GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 350,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                         (e['i']!=null)?CircleAvatar(
                            radius: 55,
                            backgroundImage: AssetImage("${e['i']}"),
                          ):CircleAvatar(
                            radius: 55,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${e['n']}",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "+91 ${e['c']}",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text("Send Message"),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.pop(context);
                                });
                              },
                              child: Text("Cancel"),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                color: Colors.white10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                     (e['i'] != null)? CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("${e['i']}"),
                      ):CircleAvatar(
                        radius: 30,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${e['n']}",
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${e['d']}",
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        "12:60 AM",
                        style: TextStyle(
                          height: -0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
