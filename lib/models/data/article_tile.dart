import 'package:nihon_shinbun/constants/default_value.dart';
import 'package:nihon_shinbun/constants/_language.dart';

class ArticleTile {
  String title;
  String imgUrl;
  DateTime creationDate;
  List<Language> translatedLanguages;

  ArticleTile(
      this.title, this.imgUrl, this.creationDate, this.translatedLanguages);

  String get getArticleImage {
    if ((imgUrl.isEmpty)) {
      return defaultArticleImageUrl;
    } else {
      return imgUrl;
    }
  }
}
