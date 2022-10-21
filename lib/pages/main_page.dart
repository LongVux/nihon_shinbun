import 'package:flutter/material.dart';
import 'package:nihon_shinbun/constants/route.dart';
import 'package:nihon_shinbun/pages/main_page_action_btns.dart';
import 'package:nihon_shinbun/providers/main_page_provider.dart';
import 'package:nihon_shinbun/routes/nested_route.dart';
import 'package:nihon_shinbun/views/article_tile_list_widget.dart';
import 'package:nihon_shinbun/views/article_view.dart';
import 'package:provider/provider.dart';

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

    final Map<String, Widget> mainPageNestedRoute = {
      MainPageNestedRoute.articles.toString(): const ArticleTileListWidget(),
      MainPageNestedRoute.article.toString(): const ArticleViewWidget(),
      MainPageNestedRoute.myArticles.toString(): const Text("my-article"),
      MainPageNestedRoute.search.toString(): const Text("search")
    };

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainPageContextProvider()),
      ],
      child: Scaffold(
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: MainPageActionBtns(navigatorKey: navigatorKey),
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
          )),
    );
  }
}
