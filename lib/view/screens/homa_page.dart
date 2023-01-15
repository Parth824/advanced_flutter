import 'dart:math';
import 'package:app_conver/view/componend/Golbel.dart';
import 'package:app_conver/view/componend/callcomponend.dart';
import 'package:app_conver/view/componend/dreaercomponend.dart';
import 'package:app_conver/view/componend/homecomponend.dart';
import 'package:app_conver/view/componend/settingcomponend.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../componend/setpper.dart';

class HomaPage extends StatefulWidget {
  const HomaPage({super.key});

  @override
  State<HomaPage> createState() => _HomaPageState();
}

class _HomaPageState extends State<HomaPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  
  @override
  void initState() {
    // TODO: implement initState
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return (Goldes.isIos == false)
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                title: Text(
                  "Platform Covertor",
                  style: TextStyle(fontSize: 15),
                ),
                // centerTitle: true,
                actions: [
                  Switch(
                    value: Goldes.isIos,
                    onChanged: (val) {
                      setState(() {
                        Goldes.isIos = val;
                      });
                    },
                  ),
                ],
                bottom: TabBar(
                  controller: controller,
                  physics: BouncingScrollPhysics(),
                  // indicator: UnderlineTabIndicator(
                  //   // borderSide: BorderSide(width: 2.5),
                  //   insets: EdgeInsets.symmetric(horizontal: 25),
                  // ),
                  indicator: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.deepPurple,
                        Colors.lightBlue,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onTap: (value) {
                    setState(() {
                    Goldes.k = value;
                    });
                  },
                  tabs: [
                    Tab(
                      text: "Home",
                    ),
                    Tab(
                      text: "Calls",
                    ),
                    Tab(
                      text: "Settings",
                    ),
                  ],
                ),
              ),
              drawer: Drawer(
                // width: 250,

                child: Drea_com(),
              ),
              body: SingleChildScrollView(
                child: AnimatedBuilder(
                  animation: controller.animation!,
                  builder: (BuildContext context, AsyncSnapshot) {
                    return Transform.rotate(
                      angle: controller.animation!.value * 6.28,
                      child: [
                        home_Page(),
                        Call_comp(),
                        Setting_comp(),
                      ][controller.animation!.value.round()],
                    );
                  },
                ),
              ),
              floatingActionButton: Builder(builder: (context) {
                return FloatingActionButton(
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          insetPadding: EdgeInsets.zero,
                          child: Container(
                            width: 320,
                            child: Flexible(
                              child: SetpperCompnt(),
                            ),
                          ),
                        );
                      },
                    );

                    setState(
                      () {
                        // Navigator.of(context).pop();
                      },
                    );
                  },
                  child: Icon(Icons.add),
                );
              }),
            ),
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                leading: Builder(
                  builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        showCupertinoDialog(
                          context: context,
                          builder: (context) {
                            return Builder(builder: (context) {
                              return Row(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Container(
                                      color: Colors.white,
                                      child: Drea_com(),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          Navigator.of(context).pop();
                                        });
                                      },
                                      child: Container(
                                        color: Colors.black12,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            });
                          },
                        );
                      },
                      child: Icon(CupertinoIcons.line_horizontal_3),
                    );
                  },
                ),
                middle: Text("Platform Covertor"),
                trailing: CupertinoSwitch(
                  value: Goldes.isIos,
                  onChanged: (val) {
                    setState(() {
                      Goldes.isIos = val;
                    });
                  },
                ),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 70,
                      ),
                      Container(
                        child: IndexedStack(
                          index: Goldes.k,
                          children: [
                            home_Page(),
                            Call_comp(),
                            Setting_comp(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  CupertinoTabBar(
                    onTap: (value) {
                      setState(() {
                       Goldes.k = value;
                      });
                    },
                    currentIndex:Goldes.k,
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.home),
                        label: "Home",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.phone),
                        label: "Call",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.settings),
                        label: "Settings",
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment(0.9, 0.8),
                    child: Container(
                      height: 55,
                      width: 55,
                      child: Builder(builder: (context) {
                        return CupertinoButton(
                          alignment: Alignment.center,
                          borderRadius: BorderRadius.circular(500),
                          color: Colors.blue,
                          child: Icon(Icons.add),
                          onPressed: () {},
                        );
                      }),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.822, 0.769),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
