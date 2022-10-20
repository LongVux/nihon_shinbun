import 'package:flutter/material.dart';
import 'package:nihon_shinbun/constants/route.dart';
import 'package:nihon_shinbun/routes/nested_route.dart';
import 'package:nihon_shinbun/views/article_tile_list_widget.dart';
import 'package:nihon_shinbun/views/article_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isInArticleViewPage = false;

  @override
  Widget build(BuildContext context) {
    final navigatorKey = GlobalKey<NavigatorState>();

    List<Widget> bottomActions = (ModalRoute.of(context)!.settings.name ==
            MainPageNestedRoute.article.toString())
        ? [
            IconButton(
                onPressed: (() => navigatorKey.currentState!.pop()),
                icon: const Icon(Icons.arrow_back_rounded)),
          ]
        : [];

    bottomActions.addAll([
      IconButton(
          onPressed: (() => navigatorKey.currentState!
              .pushNamed(MainPageNestedRoute.articles.toString())),
          icon: const Icon(Icons.article_rounded)),
      IconButton(
          onPressed: (() => navigatorKey.currentState!
              .pushNamed(MainPageNestedRoute.myArticles.toString())),
          icon: const Icon(Icons.bookmarks_rounded)),
      IconButton(
          onPressed: (() => navigatorKey.currentState!
              .pushNamed(MainPageNestedRoute.search.toString())),
          icon: const Icon(Icons.search_rounded))
    ]);

    final Map<String, Widget> mainPageNestedRoute = {
      MainPageNestedRoute.articles.toString(): const ArticleTileListWidget(),
      MainPageNestedRoute.article.toString(): const ArticleViewWidget(),
      MainPageNestedRoute.myArticles.toString(): const Text("my-article"),
      MainPageNestedRoute.search.toString(): const Text("search")
    };

    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Row(
            children: bottomActions,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (() {}),
          child: const Icon(Icons.add_rounded),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        body: Navigator(
          key: navigatorKey,
          onGenerateRoute: (settings) => onGenerateRoute(mainPageNestedRoute,
              settings, MainPageNestedRoute.articles.toString()),
        ));
  }
}
