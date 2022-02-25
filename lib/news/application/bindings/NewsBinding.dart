import 'package:book_news_api/news/application/controller/NewsController.dart';
import 'package:get/get.dart';

class NewsBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put<NewsController>(NewsController());
  }
}
