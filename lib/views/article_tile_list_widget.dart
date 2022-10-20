import 'package:flutter/material.dart';
import 'package:nihon_shinbun/constants/_language.dart';
import 'package:nihon_shinbun/models/data/article_tile.dart';
import 'package:nihon_shinbun/views/article_tile_widget.dart';

class ArticleTileListWidget extends StatefulWidget {
  const ArticleTileListWidget({super.key});

  @override
  State<ArticleTileListWidget> createState() => _ArticleTileListWidgetState();
}

class _ArticleTileListWidgetState extends State<ArticleTileListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
          children: List<int>.generate(10, (index) => index)
              .map((index) => ArticleTileWidget(
                  articleTile: ArticleTile("my article title", "",
                      DateTime.now(), [Language.vn], index.toString())))
              .toList()),
    );
  }
}
