import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
    return ListView(
        children: List<int>.generate(100, (index) => index)
            .map((index) => ArticleTileWidget(
                articleTile: ArticleTile(
                    "my article title", "", DateTime.now(), [Language.vn])))
            .toList());
  }
}
