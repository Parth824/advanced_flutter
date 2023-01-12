import 'package:app_conver/view/componend/Golbel.dart';
import 'package:flutter/material.dart';

class SetpperCompnt extends StatefulWidget {
  const SetpperCompnt({super.key});

  @override
  State<SetpperCompnt> createState() => _SetpperCompntState();
}

class _SetpperCompntState extends State<SetpperCompnt> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Stepper(
      onStepTapped: (value) {
        setState(() {
          i = value;
        });
      },
      onStepContinue: () {
        setState(() {
          if (i < 3) {
            i++;
          }
        });
      },
      onStepCancel: () {
        setState(() {
          if (i > 0) {
            i--;
          }
        });
      },
      currentStep: i,
      controlsBuilder: (context, details) {
        return (details.currentStep == 0)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (i < 2) {
                          i++;
                        }
                      });
                    },
                    child: Text("SAVE&NEXT"),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        if (i > 0) {
                          i--;
                        }
                      });
                    },
                    child: Text("CANCEL"),
                  ),
                ],
              )
            : (details.currentStep == 1)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (Goldes.name!.isNotEmpty) {
                              if (i < 2) {
                                i++;
                              }
                            }
                          });
                        },
                        child: Text("SAVE&NEXT"),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (i > 0) {
                              i--;
                            }
                          });
                        },
                        child: Text("CANCEL"),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 35,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (Goldes.name!.isNotEmpty) {
                              Goldes.l.addAll([
                                {'n': Goldes.name, 'd': Goldes.dec,'i': null}
                              ]);
                              Navigator.of(context).pop();
                            }
                          },
                          child: Center(child: Text("ADD")),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (i > 0) {
                              Navigator.of(context).pop();
                            }
                          });
                        },
                        child: Text("CANCEL"),
                      ),
                    ],
                  );
      },
      steps: [
        Step(
          isActive: (i >= 0) ? true : false,
          title: Text("PROFILE PHOTO"),
          subtitle: Text("Add profile photo"),
          content: Column(
            children: [
              Container(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text("ADD"),
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.black12,
                        radius: 50,
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 400,
                      // color: Colors.black,
                      child: Stack(
                        alignment: Alignment(0.3, 0.9),
                        children: [
                          Container(
                            height: 25,
                            // alignment: Alignment.center,
                            child: FloatingActionButton(
                              onPressed: () {},
                              child: Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        Step(
          isActive: (i > 0) ? true : false,
          title: Text("NAME"),
          subtitle: Text("Enetr name"),
          content: SingleChildScrollView(
            child: Container(
              height: 60,
              child: TextFormField(
                onChanged: (value) {
                  Goldes.name = value;
                },
                decoration: InputDecoration(
                  hintText: "Enter name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
        ),
        Step(
          isActive: (i > 1) ? true : false,
          title: Text("DISCRIPTION"),
          subtitle: Text("Enter discription"),
          content: Container(
            height: 60,
            child: TextFormField(
              onChanged: (value) {
                Goldes.dec = value;
              },
              decoration: InputDecoration(
                hintText: "Enter Discription",
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
