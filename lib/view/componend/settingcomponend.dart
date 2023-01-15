import 'package:app_conver/view/componend/Golbel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting_comp extends StatefulWidget {
  const Setting_comp({super.key});

  @override
  State<Setting_comp> createState() => _Setting_compState();
}

class _Setting_compState extends State<Setting_comp> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Date"),
              Text(
                  "${Goldes.cuurentdate.day},${Goldes.mon_name[Goldes.cuurentdate.month - 1]} ${Goldes.cuurentdate.year}"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          (Goldes.isIos == false)
              ? Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2010),
                        lastDate: DateTime(2050),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: Colors.deepPurple,
                                error: Colors.deepOrangeAccent,
                                // InverseSurface: Colors.green,
                                onSurface: Colors.black,
                                // onBackground: Colors.amber,
                                // background: Colors.amber
                                // secondary: Colors.white,

                                // onPrimary: Colors.amber,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      setState(() {
                        if (date != null) {
                         Goldes. cuurentdate = date!;
                        }
                      });
                    },
                    child: Text("Change Date"),
                  ),
                )
              : Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: CupertinoButton(
                    color: Colors.blue,
                    onPressed: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return Builder(builder: (context) {
                            return Container(
                              height: 200,
                              width: double.infinity,
                              color: Colors.white,
                              child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.date,
                                onDateTimeChanged: (value) {
                                  setState(() {
                                   Goldes. cuurentdate = value;
                                  });
                                },
                                initialDateTime:Goldes. cuurentdate,
                                maximumYear: 2050,
                                minimumYear: 2010,
                                use24hFormat: false,
                              ),
                            );
                          });
                        },
                      );
                    },
                    child: Center(
                      child: Text(
                        "Change Date",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Time"),
              (Goldes.cuurentTime.period.name == "pm")
                  ? Text(
                      "${Goldes.cuurentTime.hour}:${Goldes.cuurentTime.minute} ${Goldes.cuurentTime.period.name}")
                  : (Goldes.cuurentTime.hour == 0)
                      ? Text(
                          "${Goldes.cuurentTime.hour + 12}:${Goldes.cuurentTime.minute} ${Goldes.cuurentTime.period.name}")
                      : Text(
                          "${Goldes.cuurentTime.hour}:${Goldes.cuurentTime.minute} ${Goldes.cuurentTime.period.name}")
            ],
          ),
          SizedBox(
            height: 10,
          ),
          (Goldes.isIos == false)
              ? Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      TimeOfDay? cc = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(
                            hour: DateTime.now().hour,
                            minute: DateTime.now().minute),
                      );
                      setState(() {
                        if (Goldes.cuurentTime != null) {
                          Goldes.cuurentTime = cc!;
                        }
                      });
                    },
                    child: Text(
                      "Change Time",
                    ),
                  ),
                )
              : Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: CupertinoButton(
                    color: Colors.blue,
                    onPressed: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return Builder(builder: (context) {
                            return Container(
                              height: 200,
                              width: double.infinity,
                              color: Colors.white,
                              child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.time,
                                onDateTimeChanged: (value) {
                                  int h = value.hour;
                                  int m = value.minute;
                                  setState(() {
                                    Goldes.cuurentTime = TimeOfDay(hour: h, minute: m);
                                  });
                                },
                                initialDateTime: Goldes.cuurentdate,
                                maximumYear: 2050,
                                minimumYear: 2010,
                                use24hFormat: false,
                              ),
                            );
                          });
                        },
                      );
                    },
                    child: Center(
                      child: Text(
                        "Change Time",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
