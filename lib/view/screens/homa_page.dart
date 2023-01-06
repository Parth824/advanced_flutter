import 'dart:math';

import 'package:flutter/material.dart';

class HomaPage extends StatefulWidget {
  const HomaPage({super.key});

  @override
  State<HomaPage> createState() => _HomaPageState();
}

class _HomaPageState extends State<HomaPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int l = 0;
  @override
  void initState() {
    // TODO: implement initState
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Platform Covertor"),
        centerTitle: true,
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
      body: AnimatedBuilder(
        animation: controller.animation!,
        builder: (BuildContext context, AsyncSnapshot) {
          return Transform.rotate(
            angle: controller.animation!.value * 6.28,
            child: [
              Container(
                child: Text("Home"),
                color: Colors.amber,
                alignment: Alignment.center,
              ),
              Container(
                child: Text("Calls"),
                color: Colors.red,
                alignment: Alignment.center,
              ),
              Container(
                child: Text("Settings"),
                color: Colors.grey,
                alignment: Alignment.center,
              ),
            ][controller.animation!.value.round()],
          );
        },
      ),

    );
  }
}
