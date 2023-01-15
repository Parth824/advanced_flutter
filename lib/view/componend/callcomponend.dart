import 'package:app_conver/view/componend/Golbel.dart';
import 'package:flutter/material.dart';

class Call_comp extends StatefulWidget {
  const Call_comp({super.key});

  @override
  State<Call_comp> createState() => _Call_compState();
}

class _Call_compState extends State<Call_comp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...Goldes.l.map(
          (e) => Container(
            color: Colors.white10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  (e['i'] != null)
                      ? (e['i'].runtimeType != String)
                          ? CircleAvatar(
                              radius: 30,
                              backgroundImage: FileImage(e['i']),
                            )
                          : CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("${e['i']}"),
                            )
                      : CircleAvatar(
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
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${e['dy']}",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.call,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
