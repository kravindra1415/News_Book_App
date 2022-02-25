import 'package:book_news_api/book/application/binding/BookBinding.dart';
import 'package:book_news_api/book/ui/Book_ui.dart';
import 'package:book_news_api/news/application/bindings/NewsBinding.dart';
import 'package:book_news_api/news/ui/NewsUI.dart';
import 'package:book_news_api/pages/MyPage.dart';
import 'package:book_news_api/route/app_routes.dart';
import 'package:get/get.dart';

const initial = RoutePath.defaultRoute;

class AppPage {
  static final route = [
    GetPage(name: RoutePath.defaultRoute, page: () => const MyPage()),
    GetPage(name: RoutePath.myPage, page: () => const MyPage()),
    GetPage(
        name: RoutePath.newsPage,
        page: () => const NewsPage(),
        binding: NewsBinding()),
    GetPage(
        name: RoutePath.bookPage,
        page: () => BookPage(),
        binding: BookBinding()),
  ];
}
