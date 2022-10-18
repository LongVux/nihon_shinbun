import 'package:flutter/material.dart';
import 'package:nihon_shinbun/constants/_language.dart';
import 'package:nihon_shinbun/models/data/article_tile.dart';
import 'package:nihon_shinbun/pages/main_page.dart';
import 'package:nihon_shinbun/views/article_tile_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}
