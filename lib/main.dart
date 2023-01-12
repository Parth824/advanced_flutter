import 'package:app_conver/view/componend/homecomponend.dart';
import 'package:app_conver/view/screens/homa_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    CuPage(),
  );
}



class CuPage extends StatefulWidget {
  const CuPage({super.key});

  @override
  State<CuPage> createState() => _CuPageState();
}

class _CuPageState extends State<CuPage> {
  @override
  Widget build(BuildContext context) {
    return home_Page();
  }
}
