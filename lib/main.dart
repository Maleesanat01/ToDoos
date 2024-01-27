// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/pages/home_page.dart';
import 'package:hive/hive.dart'; //import hive databse to store the tasks so that it is there even if app is closed and opened again

void main() async {
  //initialize hive database to store the to do tasks
  await Hive.initFlutter();

  //open the box
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}
