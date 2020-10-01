import 'package:flutter/material.dart';
import 'package:flutter_app_v2/screens/day0.dart';
// import 'package:flutter_app_v2/screens/day2.dart';
// import 'package:flutter_app_v2/screens/day1.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      home: DshsList(),
    )
  );